class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = Category.all

    # Done. 5 historias más adquiridas en los últimos 7 días.
    @slice_stories = Addition.where('created_at > ?', Date.today - 7.days).group(:story).order('count_id desc').count('id').keys[0..4]
    # Solución provisional
    @slice_stories.each do |slice_story|
      if slice_story.cover == nil
        cat = I18n.transliterate(slice_story.categories.first.name).downcase
        slice_story.cover = "/assets/categories_covers/" + cat + ".jpg"
      end
    end

    # Done
    @newest_stories_by_category = Hash.new
    @categories.each do |category|
      stories = category.stories.order(release_date: :desc).limit(3)
      @newest_stories_by_category[category] = stories
    end

    # Done. Se muestran los perfiles de los usuarios cuyos libros tienen más adquisiciones.
    @writers = Profile.where(id: Addition.group(:story).order('count_id desc').count('id').keys[0..25].map(&:profile_id)).limit(6)

    render 'index'
  end
end
