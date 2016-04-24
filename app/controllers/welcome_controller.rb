class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = Category.all

    # Done. 5 historias más adquiridas en los últimos 7 días.
    @slice_stories = Addition.where('created_at > ?', Date.today - 7.days).group(:story).order('count_id desc').count('id').keys[0..4]

    # Done
    @newest_stories_by_category = Hash.new
    count = 0
    @categories.each { |cat|

      stories = cat.stories.order(release_date: :desc).limit(3)
      story1=  stories[0]
      story2 = stories[1]
      story3 = stories[2]
      @newest_stories_by_category[@categories[count]] = [story1, story2, story3]
      count = count + 1
    }

    # Done. Se muestran los perfiles de los usuarios cuyos libros tienen más adquisiciones.
    @writers = Profile.where(id: Addition.group(:story).order('count_id desc').count('id').keys[0..25].map(&:profile_id)).limit(6)


    render 'index'
  end
end
