class Category < ActiveRecord::Base
  has_many :story_categories
  has_many :stories, through: :story_categories

  validates :name, presence: true
  validates :name, uniqueness: true

  validates :description, presence: true
  validates :icon, presence: true

  has_attached_file :icon, styles: {medium:"800x600", thumb:"120x100", icon: "25x25"}
  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\Z/
end
