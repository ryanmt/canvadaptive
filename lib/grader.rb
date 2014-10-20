class Grader
  class << self
    def grade_last_answer(test_instance, question, selected_answer)
      difficulty = question.difficulty
      ability = test_instance.ability
      if selected_answer.correct
        answered_correctly(question, test_instance)
        update_ability(test_instance, question, true)
      else
        answered_wrongly(question, test_instance)
        update_ability(test_instance, question, false)
      end
    end
    def next_question(test_instance)
      finished = check_for_finished(test_instance)
      return finished if finished
      # MAX difference from Test
      range = Range.new(test_instance.ability-20,test_instance.ability+20)
      potential_questions = Question.where(difficulty: range).where.not(id: test_instance.questions_asked)
      potential_questions.sample
    end

    private
    def update_ability(test_instance, question, correct)
      difference = question.difficulty - test_instance.ability
      ability_shift = case question.difficulty - test_instance.ability
      when 10..Float::INFINITY
        13
      when 5..10
        8
      when 2..4
        2
      when 0..2
        0.5
      when -2..0
        -2.1
      when -4..-2
        -5
      when -5..-10
        -10
      else
        -13
      end
      test_instance.ability += (2 + ability_shift)/test_instance.questions_asked.size
      test_instance.save!
    end
    def check_for_finished(test_instance)
      test = Test.find(test_instance.test_id)
      return false if test_instance.questions_asked.nil?
      return false if test.question_min && test_instance.questions_asked.size < test.question_min
      if test.mastery_threshold && test_instance.ability/100.0 > test.mastery_threshold
        "success"
      elsif test.failure_threshold && test_instance.ability/100.0 < test.failure_threshold
        post_grades
        "failure"
      elsif test.question_max && test_instance.questions_asked.size > test.question_max
        "needed_more_questions"
      elsif test_instance.questions_asked.size == Question.count
        "out_of_questions"
      else
        "unknown"
      end
    end
    def post_grades
      #post_grades
    end
    def answered_correctly(question, test_instance)
      question.update_counts! true
      test_instance.update_question_lists!(question, true)
    end
    def answered_wrongly(question, test_instance)
      question.update_counts! false
      test_instance.update_question_lists!(question)
    end
  end
end