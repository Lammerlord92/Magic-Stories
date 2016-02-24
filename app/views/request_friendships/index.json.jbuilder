json.array!(@request_friendships) do |request_friendship|
  json.extract! request_friendship, :id
  json.url request_friendship_url(request_friendship, format: :json)
end
