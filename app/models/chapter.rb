class Chapter < ActiveRecord::Base
  belongs_to :story

  # child_options (opciones hijo) son las opciones
  # donde este capitulo aparece como padre
  has_many :child_options,  :class_name => 'Option', :foreign_key => 'parent_id'

  # parent_options (opciones padre) son las opciones
  # donde este capitulo aparece como hijo
  has_many :parent_options, :class_name => 'Option', :foreign_key => 'child_id'

  validates :title, presence: true
  validates :body, presence: true
end
