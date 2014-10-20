class CanvasQuestionLoader
  require 'open-uri'
  hash = YAML.load_file(Rails.root.join("config", "canvas_proxy.yml"))
  CanvasProxy = {}
  hash.each {|k,v| CanvasProxy[k.to_sym] = v}
  ALLOWED_QUESTION_TYPES = %w(multiple_choice_question true_false_question)
  URL_BASE = CanvasProxy[:url]
  PER_PAGE_PARAM = "?page=1&per_page=2000"
  HEADER = {
    "Content-Type" => 'application/json',
    "Accept" => 'application/vnd.api+json',
    "Authorization" => "Bearer #{CanvasProxy[:api_key]}"
  }
  attr_accessor :questions_hash, :statistics_hash

  def initialize(course_id: 1, quiz_id: 1)
    @course_id = course_id
    @quiz_id = quiz_id
    @url = URL_BASE + "/api/v1/courses/#{@course_id}/quizzes/#{@quiz_id}"
  end

  def make_request(url, query = nil)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host,uri.port)
    path = query ? uri.path + "?" + query : uri.path
    req = Net::HTTP::Get.new(path, initheader = HEADER)
    response = http.start {|http| http.request(req)}
    response.body if response.msg == "OK"
  end

  def fetch_questions
    url = @url + "/questions"
    @questions_hash = JSON.parse(make_request(url, PER_PAGE_PARAM))
  end

  def fetch_statistics
    url = @url + "/statistics"
    @statistics_hash = JSON.parse(make_request(url))
  end
  def fetch_quiz
  end

  def parse_questions_into_DB
    @test = Test.create!(canvas_id: @quiz_id, canvas_course_id: @course_id, title: @title? @title : "#{@course_id}_#{@quiz_id}")
    @questions_hash.each do |question_hash|
      next unless ALLOWED_QUESTION_TYPES.include?(question_hash["question_type"])
      difficulty = rand(25)
      difficulty += 10 if question_hash["question_text"][/easy/]
      difficulty += 40 if question_hash["question_text"][/medium/]
      difficulty += 70 if question_hash["question_text"][/hard/]
      @question = Question.create!(
        test_id: @test.id,
        canvas_id: question_hash["id"],
        text: question_hash["question_text"],
        name: question_hash["question_name"],
        points_possible: question_hash["points_possible"],
        question_type: question_hash["question_type"],
        asked_count: 0,
        correct_count: 0,
        difficulty: difficulty
      )
      @answers = question_hash["answers"].map do |answer|
        Answer.create!(
          question_id: @question.id,
          correct: answer['weight'] == 100 ? true : false,
          text: answer['text']
        )
      end
    end
  end

  def parse_statistics_into_DB
  end

  def process!
    fetch_questions
    parse_questions_into_DB
    fetch_statistics
    parse_statistics_into_DB
  end
end
