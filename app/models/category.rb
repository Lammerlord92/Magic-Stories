class Category < ActiveRecord::Base
  has_many :story_categories
  has_many :stories, through: :story_categories
end
