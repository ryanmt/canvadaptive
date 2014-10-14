class CanvasQuestionLoader
  require 'open-uri'

  URL_BASE = "localhost:3000"
  HEADER = {
    "Content-Type" => 'application/json',
    "Accept" => 'application/vnd.api+json',
    "Authorization" => 'Bearer 0aESpgltJtPEHwLgplgDJxSQKZiQ1lCiULV0NfNXP5MI1f3v6uY3745bQfIXGzBT'
  }
  attr_accessor :questions_hash, :statistics_hash

  def initialize(course_id: 1, quiz_id: 1)
    @course_id = course_id
    @quiz_id = quiz_id
    binding.pry
    @url = URL_BASE + "/api/v1/courses/#{@course_id}/quizzes/#{@quiz_id}"
  end
  
  def fetch
    url = @url + "/questions"
    @questions_hash = JSON.parse(open(url, HEADER).read)
  end

  def fetch_statistics
    url = @url + "/statistics"
    @statistics_hash = JSON.parse(open(url, HEADER).read)
  end

  def parse_questions_into_DB
    @questions_hash.each do |question_hash|
      @question = Question.create(
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
        Answer.create(
          question_id: @question.id,
          correct: answer['weight'] == 100 ? true : false,
          text: answer['text']
        )
      end
    end
  end
end