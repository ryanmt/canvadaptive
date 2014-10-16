json.test_instance do |json|
  json.extract! @test, :id, :title, :description, :created_at, :updated_at, :created_at, :updated_at
json.question do |json|
  json.extract! @question, :id, 
  json.array!(@tests) do |test|
    json.extract! test, :id, :title, :description, :created_at, :updated_at
    json.url test_url(test, format: :json)
  end
end
