class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    # TODO: Provisional. El backend tiene que insertar la historia tendencia de cada género
    @trending_stories = Hash.new
    @trending_stories[Category.find(1)] = Story.find(1)
    @trending_stories[Category.find(2)] = Story.find(13)
    @trending_stories[Category.find(3)] = Story.find(3)
    @trending_stories[Category.find(4)] = Story.find(4)
    @trending_stories[Category.find(5)] = Story.find(5)
    @trending_stories[Category.find(6)] = Story.find(6)

    # TODO: Provisional. El backend tiene que insertar listas de historias tendencias de cada género
    @first_six_trending_stories = Hash.new
    @first_six_trending_stories[Category.find(1)] = [Story.find(1), Story.find(2), Story.find(7), Story.find(8), Story.find(9), Story.find(10)]
    @first_six_trending_stories[Category.find(2)] = [Story.find(13), Story.find(3), Story.find(4), Story.find(5), Story.find(6), Story.find(12)]
    @first_six_trending_stories[Category.find(3)] = [Story.find(3), Story.find(8), Story.find(9), Story.find(10), Story.find(11), Story.find(4)]
    @first_six_trending_stories[Category.find(4)] = [Story.find(4), Story.find(5), Story.find(6), Story.find(7), Story.find(8), Story.find(9)]
    @first_six_trending_stories[Category.find(5)] = [Story.find(5), Story.find(6), Story.find(7), Story.find(8), Story.find(9), Story.find(10)]
    @first_six_trending_stories[Category.find(6)] = [Story.find(6), Story.find(5), Story.find(6), Story.find(7), Story.find(8), Story.find(9)]

    @categories = Category.all
    render 'index'
  end
end
