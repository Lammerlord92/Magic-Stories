class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = Category.all

    # TODO: Provisional. El backend tiene que insertar la historia tendencia de cada género
    @trending_stories = Hash.new
    @trending_stories[@categories[0]] = Story.find(1)
    @trending_stories[@categories[1]] = Story.find(13)
    @trending_stories[@categories[2]] = Story.find(3)
    @trending_stories[@categories[3]] = Story.find(4)
    @trending_stories[@categories[4]] = Story.find(5)
    @trending_stories[@categories[5]] = Story.find(6)


    #
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
    render 'index'
  end
end
