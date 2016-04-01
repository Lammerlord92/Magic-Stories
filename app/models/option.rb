class Option < ActiveRecord::Base

  belongs_to :parent, class_name: 'Chapter'
  belongs_to :child,  class_name: 'Chapter'

  validates :option, presence: true
  validates_associated :parent
  validates_associated :child
end
