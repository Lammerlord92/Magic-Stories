class Category < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :icon, presence: true

  has_many :has_categories
  has_many :stories, through: :has_categories
end
