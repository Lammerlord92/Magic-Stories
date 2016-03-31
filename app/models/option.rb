class Option
  include Cequel::Record
  key :id, :timeuuid, auto: true
  column :option, :text #Podría ser la key, depende de lo que sea option
#  belongs_to :parent, class_name: 'Chapter'
#  belongs_to :child,  class_name: 'Chapter'

#  validates :option, presence: true
#  validates_associated :parent
#  validates_associated :child
end
