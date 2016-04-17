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

    # TODO: Provisional. El backend tiene que insertar las historias más nuevas de cada género
    @newest_stories_by_category = Hash.new
    @newest_stories_by_category[@categories[0]] = [Story.find(1), Story.find(2), Story.find(3)]
    @newest_stories_by_category[@categories[1]] = [Story.find(13), Story.find(4), Story.find(5)]
    @newest_stories_by_category[@categories[2]] = [Story.find(6), Story.find(7), Story.find(8)]
    @newest_stories_by_category[@categories[3]] = [Story.find(9), Story.find(10), Story.find(11)]
    @newest_stories_by_category[@categories[4]] = [Story.find(12), Story.find(1), Story.find(2)]
    @newest_stories_by_category[@categories[5]] = [Story.find(3), Story.find(4), Story.find(5)]

    render 'index'
  end
end
