class ProfilesController < ApplicationController
  before_action :params_search, only: [:search]
  
  #GET /profiles
  def index
    @profiles = Profile.all
  end

  #GET /profiles/:id
  def show
    @profile = Profile.find(params[:id])
    @is_current_profile = is_current_profile? @profile
  end

  #GET /profiles/new
  def new
    current_profile = current_user.profile
    if current_profile.present?
      @profile = Profile.new
    else
      head :forbidden # TODO: Mejor redirigir a public/403.html (por crear) para estos casos
    end
  end

  def edit
    @profile = set_profile
    current_profile = current_user.profile
    if @profile.id != current_profile.id
      head :forbidden # TODO: Mejor redirigir a public/403.html (por crear) para estos casos
    end
  end

  def create
    @profile = Profile.new(profile_params)
    if current_user.profile.present? # No permitas que un usuario cree más de un perfil
      @profile.user_id = current_user.id
      if @profile.save
        redirect_to @profile
      else
        render :new
      end
    else
      head :forbidden
    end
  end

  def update
    @profile = set_profile
    if is_current_profile? @profile # No permitas que un usuario edite un perfil que no es suyo
      if @profile.update(profile_params)
        redirect_to @profile
      else
        render :edit
      end
    else
      head :forbidden
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
    render 'index'

  end

  #GET /profiles/premium/:id
  def premium
    profile = Profile.find(params[:id])
    user = profile.user

    if user.role_type == 'FreeUser'
      premiumUser = PremiumUser.create()
      user.update_attribute(:role, premiumUser)
    end

    redirect_to profile
  end

  #GET /profiles/ban/:id
  def ban
    date = params[:date]
    profile = Profile.find(params[:id])
    user = profile.user

    user.update_attribute(:banned_until, date)

    redirect_to profile
  end

  # Devuelve true si el 'profile' dado pertenece al usuario autentificado
  def is_current_profile?(profile)
    if current_user.present?
      @current_profile = current_user.profile
      return profile.id == @current_profile.id
    else
      return false
    end
  end

end