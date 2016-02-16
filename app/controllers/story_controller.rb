class StoryController < ApplicationController

    #GET /story
    def index
       @stories = Story.all
    end
    def show
    end
end
