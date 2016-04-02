class Category < ActiveRecord::Base
  has_many :story_categories
  has_many :stories, through: :story_categories

  validates :name, presence: true
  validates :name, uniqueness: true

  validates :description, presence: true
  validates :icon, presence: true


end
