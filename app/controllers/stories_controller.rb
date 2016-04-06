class StoriesController < ApplicationController

  #GET /stories
  def index
    @stories = Story.all
  end

  # Devuelve una lista con las historias adquiridas por
  # el usuario logueado o un aviso si no tiene
  def acquired
    profile  = Profile.find_by(user: current_user)
    additions = Addition.where(profile_id: profile)
    @stories = []
    additions.each do |addition|
      @stories << addition.story
    end
    if @stories.blank?
      flash.alert = 'No se han encontrado resultados'
    end
  end

  # Devuelve una lista con las historias creadas por
  # el usuario logueado o un aviso si no tiene
  def created
    #profile  = Profile.find_by(user: current_user)
    @stories = current_user.profile.stories
    if @stories.blank?
      flash.alert = 'No se han encontrado resultados'
    end
  end

  #GET /stories/read/:id
  def read
    # @story = Story.find(params[:id])
  end

  def example
    @story = Story.find_by_title('Caperucita Roja')
    render 'stories/dbread'
  end

  def dbread
    @story = Story.find(params[:id]);
  end

  #GET /stories/:id
  def show
    @story = Story.find(params[:id])
    @comments = @story.comments
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
        flash[:alert] = 'Error almacenando historia'
        @categories = Category.all
        render :new
      end
    else
      flash[:notice] = 'Formato de fecha invalido'
      render :new
    end
  end

  def story_params
    # Con frontpage -> params.require(:story).permit(:title,:description,:cover,:frontpage,:language,:price,:release_date,:published,:num_purchased)
    params.require(:story).permit(:title,:description,:cover,:language,:price,:release_date,:published,:num_purchased)
  end

  def search
    # Documentacion sobre queries aqui:
    # http://guides.rubyonrails.org/active_record_querying.html
    @q = params[:q].downcase
    @categories = Category.all
    query = 'lower(title) like :q OR lower(description) like :q OR lower(language) like :q and published = true'
    if @q
      @stories = Story.where(query, {q: "%#{@q}%"})
      if @stories.blank?
        flash.alert = 'No se han encontrado resultados'
      end
    else
      @stories = Story.where(published: true)
    end
  end

end
