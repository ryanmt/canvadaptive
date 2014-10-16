json.question do |json|
  json.extract! @question, :id, :text, :difficulty, :asked_count, :correct_count
  json.url question_url(@question, format: :json)
end
