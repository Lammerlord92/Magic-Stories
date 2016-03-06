class ProfilesController < ApplicationController
  before_action :params_search, only: [:search]
  #GET /profiles
  def index
    id = current_user.id
    @profile = Profile.find_by_user_id(id)
  end

  #GET /profiles/:id
  def show
    @profile = Profile.find(params[:id])
  end


  #GET /profiles/new
  def new
    @profile = Profile.new
  end


  def edit
    @profile=set_profile
  end

  def create
    @profile= Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to @profile
    else
      render :new
    end
  end

  def update
    @profile=set_profile
    if @profile.update(profile_params)
      redirect_to @profile
    else
      render :edit
    end
  end

  def profile_params
    params.require(:profile).permit(:name,:description,:avatar, :signature, :profile_status)
  end

  def set_profile
    @profile=Profile.find(params[:id])
  end

  def params_search

    params.permit(:q, :choice)
  end


  def search
    choice = params[:choice]
    @q = params[:q].downcase

    # Si se quiere filtrar entre amigos
    if (choice == "friends")

      # Si q tiene alguna string para filtrar
      if @q
        subquery = '(friendships.user_id != :cu_id and friendships.friend_id = :cu_id)'
        query = '(lower(profiles.name) like :q OR lower(signature) like :q OR lower(description) like :q)'
        @profiles = Profile.distinct(:user_id).joins(:friendships).where(subquery, {cu_id: current_user.id}) & Profile.where(query, q: "%#{@q}%")


        if @profiles.blank?
          flash.alert = "Profile Not found"
        end
        #Si no tiene alguna string habrá que devolver todos los amigos
      else
        query = '(friendships.user_id != :cu_id and friendships.friend_id = :cu_id)'
        @profiles = Profile.distinct(:user_id).joins(:friendships).where(query, {cu_id: current_user.id})
      end

      # Si se quiere filtrar entre no amigos
    end
    if (choice == "no_friends")

      # Si q tiene alguna string buscamos por q y no amigos
      if @q
        query = '(lower(profiles.name) like :q OR lower(signature) like :q OR lower(description) like :q)'
        subquery = '(users.id != :cu_id and friendships.friend_id = :cu_id)'

        @profiles = Profile.where(query, q: "%#{@q}%") &
            (Profile.all - Profile.distinct(:user_id).joins(:friendships).where(subquery, {cu_id: current_user.id}))
        if @profiles.blank?
          flash.alert = "Profile Not found"
        end

        # Si no, solo no_amigos
      else
        query = '(users.id != :cu_id and friendships.friend_id = :cu_id)'
        @profiles = Profile.all - Profile.distinct(:user_id).joins(:friendships).where(query, {cu_id: current_user.id})
      end

      # Si no hay elección alguna entre amigos y no amigos, se filtra por q entre todos los perfiles
    else
      query = '(lower(name) like :q OR lower(signature) like :q OR lower(description) like :q)'

      if @q
        @profiles = Profile.where(query, {q: "%#{@q}%"})
        if @profiles.blank?
          flash.alert = "Profile Not found"
        end
      end


    end
    @profiles
    render 'list'

  end


end