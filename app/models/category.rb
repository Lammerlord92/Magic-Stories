class Category
  include Cequel::Record
#  has_many :story_categories
#  has_many :stories, through: :story_categories

  key :id, :timeuuid, auto: true
  column :name, :text, :index => true
  column :description, :text
  column :icon, :text
  validates :description, presence: true
  validates :icon, presence: true
#  validates :icon, presence: true

  #Forma de comprobar que el nombre es único
  before_save :check_category_name
  def check_category_name
    c=Category.find_by_name(self.name)
    if !c.nil?
      if !(c.id==self.id)
        self.errors.add(:category,'Ese nombre ya existe, panoli')
        false
      end
    end
  end
#  has_attached_file :icon, styles: {medium:"800x600", thumb:"120x100", icon: "25x25"}
#  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\Z/
end
