json.array!(@stories) do |story|
  json.extract! story, :id, :user_id, :title, :comment
  json.url story_url(story, format: :json)
end
