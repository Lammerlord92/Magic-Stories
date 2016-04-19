class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = Category.all

    # TODO: Provisional. El backend tiene que insertar las historias del slice
    @slice_stories = [Story.find(13), Story.find(1), Story.find(2)]

    # TODO: Provisional. El backend tiene que insertar las historias más nuevas de cada género
    @newest_stories_by_category = Hash.new
    count = 0
    @categories.each { |category|

      # TODO: Hay que cambiar esta sentencia para que haga un where por categoría
      stories = Story.limit(3).order("release_date DESC")
      story1=  stories[0]
      story2 = stories[1]
      story3 = stories[2]
      @newest_stories_by_category[@categories[count]] = [story1, story2, story3]
      count = count + 1
    }

    # TODO: Provisional. El backend tiene que insertar los seis mejores escritores
    @writers = Profile.first(6)

    render 'index'
  end
end
