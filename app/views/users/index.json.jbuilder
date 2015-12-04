json.array!(@users) do |user|
  json.extract! user, :id, :specialist, :experience, :institute, :radiologist, :pathologist, :schedule, :cases
  json.url user_url(user, format: :json)
end
