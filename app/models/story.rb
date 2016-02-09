class Story < ActiveRecord::Base
  attr_reader :categories

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
