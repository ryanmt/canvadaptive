class Answer < ActiveRecord::Base
  belongs_to :question
  
  validates :type, inclusion: { in: %w(multiple_answers_question true_false_question)}
end
