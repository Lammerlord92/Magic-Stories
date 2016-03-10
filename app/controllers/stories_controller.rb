class StoriesController < ApplicationController

  #GET /stories
  def index
    @stories = Story.all
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

  # Muestra una lista con las historias adquiridas por
  # el usuario logueado o un aviso si no tiene 
  def show_stories_acquired
    profile  = Profile.find_by(user: current_user)
    additions = Addition.where(profile_id: profile)
    @stories = []
    additions.each do |addition|
      @stories << addition.story
    end
    if @stories.blank?
      flash.alert = 'Not found'
    end
  end

  # Muestra una lista con las historias creadas por
  # el usuario logueado o un aviso si no tiene 
  def show_stories_created
    #profile  = Profile.find_by(user: current_user)
    @stories = current_user.profile.stories
    if @stories.blank?
      flash.alert = 'Not found'
    end
  end

  def showAll

  end

  def search
    # Documentacion sobre queries aqui:
    # http://guides.rubyonrails.org/active_record_querying.html
    @q = params[:q].downcase
    query = 'lower(title) like :q OR lower(description) like :q OR lower(language) like :q and published = true'
    if @q
      @stories = Story.where(query, {q: "%#{@q}%"})
      if @stories.blank?
        flash.alert = 'Not found'
      end
    else
      @stories = Story.where(published: true)
    end
    render 'index'
  end

end
