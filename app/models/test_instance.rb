class TestInstance < ActiveRecord::Base
  belongs_to :user
  has_one :test
  after_initialize do |test_instance|
    attempt_id ||= 0
    questions_asked ||= []
    questions_correct ||= []
    ability ||= 50
  end

  def update_question_lists!(question, correct=false)
    self.questions_asked.push question.id
    self.questions_asked_will_change!
    if correct
      self.questions_correct.push question.id
      self.questions_correct_will_change!
    end
    self.save!
  end
end
