class Category
  include Cequel::Record
#  has_many :story_categories
#  has_many :stories, through: :story_categories
  validates :name, presence: true
  key :id, :timeuuid, auto: true
  column :name, :text
  column :description, :text
  column :icon, :text
  validates :description, presence: true
  validates :icon, presence: true
#  validates :icon, presence: true

#  has_attached_file :icon, styles: {medium:"800x600", thumb:"120x100", icon: "25x25"}
#  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\Z/
end
