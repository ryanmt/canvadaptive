json.question do |json|
  json.extract! @question, :id, :text, :difficulty, :asked_count, :correct_count
  json.url questions_url(@question, format: :json)
  json.array!(@question.answers) do |answer|
    json.extract! answer, :correct, :text
  end
end
