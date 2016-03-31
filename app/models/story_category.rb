class StoryCategory
  include Cequel::Record

  key :story_id,:timeuuid
  key :category_id,:timeuuid
#  belongs_to :story
#  belongs_to :category
end
