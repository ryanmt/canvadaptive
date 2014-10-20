class Question < ActiveRecord::Base
  validates :question_type, inclusion: { in: %w(multiple_choice_question multiple_answers_question true_false_question)}
  validates :difficulty, numericality: true
  belongs_to :test
  has_many :answers

  def update_counts!(correct)
    self.asked_count += 1
    self.correct_count += 1 if correct
  end
end
