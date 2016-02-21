class Story < ActiveRecord::Base
  #validates :frontpage, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :language, presence: true
  #Precio debe ser minimo 0
  #validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0}
  # :release_date debe estar en pasado
  validates_associated :chapters
  validate :check_date

  attr_reader :categories
  has_many :chapters
  has_many :story_categories
  has_many :categories, through: :story_categories

  validates :cover, presence: true

  #Creador perfil

  belongs_to :creatorProfile, class_name: "Profile", foreign_key: "profile_id"

  # Lectores perfiles, para ir a usuario se tiene que hacer a raiz del perfil, no se pueden dar dos saltos. (NO through through)

  has_many :readings
  has_many :readerProfiles, through: :readings



  has_attached_file :cover, styles: {medium: "1280x720", thumb:"500x300"}
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/


  #Setter de la relación
  def categories=(value)
    @stories=value
  end


  def check_date
    date1 = release_date - 1
    date2 = Time.now()

    date2 > date1
  end

  private

  def save_categories
    @categories.each do |category_id|
      Story_category.create(category_id:category_id, story_id:self.id)
    end
  end




end
