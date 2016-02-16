class StoriesController < ApplicationController

    #GET /stories
    def index
       @stories = Story.all
    end

    #GET /stories/:id
    def show
      @story = Story.find(params[:id])
    end

    #GET /stories/new
    def new
      @story = Story.new
    end

    #POST /stories
    def create
      @story = Story.new(frontpage: params[:story][:frontpage],
                            title: params[:story][:title],
                             description: params[:story][:description],
                              language: params[:story][:language],
                              price: params[:story][:price],
                              release_date: params[:story][:release_date],
                              published: false,
                              num_purchased: 0)

      if @story.save
        redirect_to @story
      else
        render :new
      end
    end
end
