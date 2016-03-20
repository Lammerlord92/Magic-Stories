# story json render: GET /stories/1.json
json.(@story, :id,
              :title,
              :description,
              :language,
              :price,
              :release_date,
              :published,
              :num_purchased)
json.chapter_ids @story.chapter_ids
json.profile(@story.creatorProfile, :id, :name)
json.categories @story.categories do |category|
  json.name category.name
  json.icon category.icon
end