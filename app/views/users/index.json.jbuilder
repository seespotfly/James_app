json.array!(@users) do |user|
  json.extract! user, :name, :phone_number, :company, :relationship
  json.url user_url(user, format: :json)
end
