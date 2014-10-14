json.tests do |json|
  json.array!(@tests) do |test|
    json.extract! test, :id, :title, :description, :created_at, :updated_at
    json.url test_url(test, format: :json)
  end
end
