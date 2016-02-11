class Story < ActiveRecord::Base
  validates :frontpage, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :language, presence: true
  #Precio debe ser minimo 0
  #validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0}
  # :release_date debe estar en pasado
  validates_associated :chapters

  attr_reader :categories
  has_many :chapters
  has_many :story_categories
  has_many :categories, through: :story_categories
  #Setter de la relación
  def categories=(value)
    @stories=value
  end

  private

  def save_categories
    @categories.each do |category_id|
      Story_category.create(category_id:category_id, story_id:self.id)
    end
  end


end
