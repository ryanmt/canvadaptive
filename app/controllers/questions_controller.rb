class QuestionsController < ApplicationController
  protect_from_forgery with: :null_session
  #before_action :set_question, only: [:show, :edit, :update, :destroy]
  require 'grader'
  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/:id
  def get_next(test_instance = nil)
    test_instance ||= set_test_instance
    @question = ::Grader.next_question(test_instance)
  end
  # POST /questions/:id
  def update
    @previous_question = set_question
    set_test_instance
    @selected_answer = Answer.find(params[:selected_answer][:id])
    ::Grader.grade_last_answer(@test_instance, @previous_question, @selected_answer)

    get_next
    if @question.is_a? Question
      render template: 'questions/get_next'
    else
      redirect_to "/#{@question}"
    end
  end
  #"http://localhost:3100/questions.json"

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end
    def set_test_instance
      @test_instance = TestInstance.find(params[:test_instance_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:text, :difficulty, :asked_count, :correct_count)
    end
end
