json.questions do |json|
  json.array!(@questions) do |question|
    json.extract! question, :id, :text, :difficulty, :asked_count, :correct_count
    json.url question_url(question, format: :json)
  end
end
