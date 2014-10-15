class Grader
  def grade_last_answer(test_instance, question, selected_answer)
    difficulty = question.difficulty
    ability = user.ability
    if selected_answer.correct
      question.update_counts! true
      test_instance.update_question_lists!(question, true)
    else
      question.update_counts! false
      test_instance.update_question_lists!(question)
    end
  end
  def grab_next_question(user)
    # MAX difference from Test
    range = 0..1
    Question.where(difficulty: range)
  end
end