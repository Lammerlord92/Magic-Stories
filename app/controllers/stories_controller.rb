class StoriesController < ApplicationController
  before_action :params_search, only: [:search]

  #GET /stories

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
    @categories = Category.all
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
        flash[:alert] = 'Error saving story'
        @categories = Category.all
        render :new
      end
    else
      flash[:notice] = 'invalid date'
      render :new
    end
  end


  def story_params
    # Con frontpage -> params.require(:story).permit(:title,:description,:cover,:frontpage,:language,:price,:release_date,:published,:num_purchased)
    params.require(:story).permit(:title,:description,:cover,:language,:price,:release_date,:published,:num_purchased)
  end

  #TODO Aun no se pueden adquirir historias
  def show_stories_acquired
    @stories = []
  end


    def show_stories_acquired
      @stories = Story.find_by_profile_id(params[:id])
    end


    def read
      # @story = Story.find(params[:id])
    end


  def show_stories_created
    profile = Profile.find_by(user: current_user)
    @stories = Story.where(creatorProfile: profile)
  end

  def params_search
    params.permit(:q)
  end



def search
  # Documentacion sobre queries aqui:
  # http://guides.rubyonrails.org/active_record_querying.html
  @q = params[:q]
  query = 'title like :q OR description like :q OR language like :q and published = true'
  if @q
    @stories = Story.where(query, {q: "%#{@q}%"})
    if @stories.blank?
      flash.alert = "Not found"
    end
  else
    @stories = Story.where(published: true)
  end

  render 'list'
end

end
