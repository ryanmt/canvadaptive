class Grader
  def grade_last_answer(test_instance, question, selected_answer)
    difficulty = question.difficulty
    ability = test_instance.ability
    if selected_answer.correct
      answered_correctly(question, test_instance)
    else
      answered_wrongly(question, test_instance)
    end
  end
  def answered_correctly(question, test_instance)
    question.update_counts! true
    test_instance.update_question_lists!(question, true)
  end
  def answered_wrongly(question, test_instance)
    question.update_counts! false
    test_instance.update_question_lists!(question)
  end
  def grab_next_question(user)
    # MAX difference from Test
    range = 0..1
    Question.where(difficulty: range)
  end
end