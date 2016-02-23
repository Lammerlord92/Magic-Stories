class StoriesController < ApplicationController

    #GET /stories
    def index
      @q = params[:q]                                   #Puequeño Buscador que comprueba que el parametro q del formulario
      if @q                                             # es igual a cada atributo y devuelve el filtrado en caso negativo devuelve All.
        @stories = Story.where(:title  => @q )
      elsif @stories.nil?
        @stories = Story.where(:description  => @q )
      elsif @stories.nil?
        @stories = Story.where(:price  => @q )
      elsif @stories.nil?
        @stories = Story.where(:language  => @q )
      else
        @stories = Story.all
      end
    end

    #GET /stories/read/:id
    def read
      # @story = Story.find(params[:id])
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
      @story = Story.new(story_params)
      @story.num_purchased = 0
      @story.published = false

      if @story.check_date
        if @story.save
          redirect_to @story
        else
          render :new
        end
      else
        flash[:notice] = 'invalid date'
        render :new
      end
    end


    def story_params
      # Con frontpage-> params.require(:story).permit(:title,:description,:cover,:frontpage,:language,:price,:release_date,:published,:num_purchased)
      params.require(:story).permit(:title,:description,:cover,:language,:price,:release_date,:published,:num_purchased)
    end


    def show_stories_acquired
      @stories = Story.find_by_profile_id(params[:id])

    end
end
