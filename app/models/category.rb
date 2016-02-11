class Category < ActiveRecord::Base
  has_many :story_categories
  has_many :stories, through: :story_categories

  has_attached_file :icon, styles: {medium:"100x100"}
  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\Z/
end
