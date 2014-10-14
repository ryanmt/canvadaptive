json.users do |json|
  json.array!(@users) do |user|
    json.extract! user, :id, :email, :full_name, :id, :role
    json.url user_url(user, format: :json)
  end
end