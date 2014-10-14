class CanvasQuestionLoader
  require 'open-uri'
  ALLOWED_QUESTION_TYPES = %w(multiple_answers_question true_false_question)
  URL_BASE = "https://localhost:3000"
  HEADER = {
    "Content-Type" => 'application/json',
    "Accept" => 'application/vnd.api+json',
    "Authorization" => 'Bearer 0aESpgltJtPEHwLgplgDJxSQKZiQ1lCiULV0NfNXP5MI1f3v6uY3745bQfIXGzBT'
  }
  attr_accessor :questions_hash, :statistics_hash

  def initialize(course_id: 1, quiz_id: 1)
    @course_id = course_id
    @quiz_id = quiz_id
    @url = URL_BASE + "/api/v1/courses/#{@course_id}/quizzes/#{@quiz_id}"
  end

  def make_request(url)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host,uri.port)
    req = Net::HTTP::Get.new(uri.path, initheader = HEADER)
    response = http.start {|http| http.request(req)}
    response.body if response.msg == "OK"
  end

  def fetch_questions
    url = @url + "/questions"
    @questions_hash = JSON.parse(make_request(url))
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
      @question = Question.create!(
        test_id: @test.id,
        canvas_id: question_hash["id"],
        text: question_hash["question_text"],
        name: question_hash["question_name"],
        points_possible: question_hash["points_possible"],
        question_type: question_hash["question_type"],
        asked_count: 0,
        correct_count: 0,
        difficulty: 0
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