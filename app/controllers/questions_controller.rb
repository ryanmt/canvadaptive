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
  def get_next
    @test_instance = TestInstance.find(params[:test_instance_id])
    @question = ::Grader.next_question(@test_instance)
  end
  # POST /questions/:id
  def update
    if params[:selected_answer][:correct]
    end
    @previous_question = Question.find(params[:id])
    # These will render the next question back in AJAX.
    if @question.nil?
      # This means that we are done!
    else
      get_next
      render template: 'questions/get_next'
    end
  end
  #"http://localhost:3100/questions.json"

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:text, :difficulty, :asked_count, :correct_count)
    end
end
