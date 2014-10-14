class Question < ActiveRecord::Base
  validates :question_type, inclusion: { in: %w(multiple_answers_question true_false_question)}
  validates :difficulty, numericality: true
  belongs_to :test
  has_many :answers
end
