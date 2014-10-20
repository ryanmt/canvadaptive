json.question do |json|
  json.extract! @question, :id, :text, :difficulty, :asked_count, :correct_count, :answers
  json.json_url questions_url(@question, format: :json)
  json.post_url questions_url + "/#{@question.id}/update"
end
json.test_instance do |json|
  json.extract! @test_instance, :id, :ability, :questions_asked
end
