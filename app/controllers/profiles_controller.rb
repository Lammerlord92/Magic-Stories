class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :params_search, only: [:search]

  #GET /profiles
  def index
    @profiles = Profile.all
  end

  #GET /profiles/:id
  def show
    begin
      @profile = Profile.find(params[:id])
      @is_current_profile = is_current_profile? @profile
      # @is_friend_profile = is_friend_profile? @profile
      #unless @is_current_profile or @profile.profile_status == 'PUBLIC' or @is_friend_profile
      #  render 'errors/permission_denied'
      #end
      @comments = @profile.comments
    rescue ActiveRecord::RecordNotFound => e      # Profile.find is null
      render 'errors/not_found'
    end

  end

  #GET /profiles/new
  def new
    current_profile = current_user.profile
    if current_profile.present?
      render 'errors/not_found'
    else
      render 'errors/permission_denied'
    end
  end

  def edit
    begin
      @profile = set_profile
      current_profile = current_user.profile
      if @profile.id != current_profile.id
        render 'errors/permission_denied'
      end
    rescue Exception::StandardError::NameError::NoMethodError => e      # current_user is null
      render 'errors/permission_denied'
    rescue ActiveRecord::RecordNotFound => e      # profile.id not exist
      render 'errors/not_found'
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
      render 'errors/permission_denied'
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
      render 'errors/permission_denied'
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

=begin t

  def search
    choice = params[:choice]
    @q = params[:q]

    if @q
      @q = @q.downcase
    else
      @q = ''
    end

    queryUser = '(lower(name) like :q OR lower(surname1) like :q OR lower(surname2) like :q OR lower(email) like :q OR lower(username) like :q)'

    # Si se quiere filtrar entre amigos
    if user_signed_in? and choice == "friends"

      # Si q tiene alguna string para filtrar
      if @q
        subquery = '(friendships.user_id != :cu_id and friendships.friend_id = :cu_id)'
        #query = '(lower(profiles.name) like :q OR lower(signature) like :q OR lower(description) like :q)'

        # JUST A QUERY, antes había dos y se fusionaban gastando recursos de la aplicación, ahora la base de datos devuelve todo. Eso si, es una megaquery.
        @profiles = Profile.distinct(:user_id).joins(:friendships).where(subquery, {cu_id: current_user.id}).where(user_id: User.where(queryUser, {q: "%#{@q}%"}))


        if @profiles.blank?
          flash.now.alert = "Perfil no encontrado"
        end
        #Si no tiene alguna string habrá que devolver todos los amigos
      else
        query = '(friendships.user_id != :cu_id and friendships.friend_id = :cu_id)'
        @profiles = Profile.distinct(:user_id).joins(:friendships).where(query, {cu_id: current_user.id})
      end


      # Si se quiere filtrar entre no amigos

    elsif user_signed_in? and choice == "no_friends"

      # Si q tiene alguna string buscamos por q y no amigos
      if @q
        query = '(lower(profiles.name) like :q OR lower(signature) like :q OR lower(description) like :q)'
        subquery = '(users.id != :cu_id and friendships.friend_id = :cu_id)'
        users = User.where(queryUser, {q: "%#{@q}%"})
        # FIXME - Cuando sobre tiempo hay que hacer más efeciente esta operación.
        @profiles = Profile.where(user_id: users) &
            (Profile.all - Profile.distinct(:user_id).joins(:friendships).where(subquery, {cu_id: current_user.id}))

        if @profiles.blank?
          flash.now.alert = "Perfil no encontrado"
        end

        # Si no, solo no_amigos
      else
        query = '(users.id != :cu_id and friendships.friend_id = :cu_id)'
        @profiles = Profile.all - Profile.distinct(:user_id).joins(:friendships).where(query, {cu_id: current_user.id})
      end

      # Si no hay elección alguna entre amigos y no amigos, se filtra por q entre todos los perfiles
    else
      #query = '(lower(name) like :q OR lower(signature) like :q OR lower(description) like :q'

      if @q
        #@profiles = Profile.where(query, {q: "%#{@q}%"})
        @profiles = Profile.where(user_id: users)
        if @profiles.blank?
          flash.now.alert = "Perfil no encontrado"
        end
      end

    end
    #@profiles
    #render 'index'

  end

=end
  #FIXME - Nos estamos hackeando a nosotros mismos. Pasar a un usuario premium así bytheface? Sin restringir quien puede acceder a esta URL?
  #Además va a dar petidos pues el usuario premium ya tiene una fecha de expiración que es obligatoria. Si se quiere mantener este método
  #habría que usar el upgradeUser de MembershipCardsHelper. Creando primero una membershipCard.
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

  #GET /profiles/follow/:id
  def follow
    begin
      profile = Profile.find(params[:id])
      current_user.profile.follow!(profile)
    #  flash.now.alert = "Perfil id: " + Profile.find(params[:id]).to_s + "  Perfil actual: " + current_profile.to_s
      redirect_to profile
    rescue Exception::StandardError::NameError::NoMethodError => e      # current_user is null
      render 'errors/permission_denied'
    rescue ActiveRecord::RecordNotFound => e      # profile.id not exist
      render 'errors/not_found'
    end
  end

  #GET /profiles/unfollow/:id
  def unfollow
    begin
      profile = Profile.find(params[:id])
      current_user.profile.unfollow!(profile)
      #  flash.now.alert = "Perfil id: " + Profile.find(params[:id]).to_s + "  Perfil actual: " + current_profile.to_s
        redirect_to profile
    rescue Exception::StandardError::NameError::NoMethodError => e      # current_user is null
      render 'errors/permission_denied'
    rescue ActiveRecord::RecordNotFound => e      # profile.id not exist
      render 'errors/not_found'
    end
  end

  # Devuelve true si el 'profile' dado es seguido por el usuario
  def is_follow_this_profile?(profile)
    #   return current_user.profile.follows?(profile)

    @current_profile = current_user.profile
    return @current_profile.follows?(profile)
#    return profile.id == @current_profile.id

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
=begin t
  # Devuelve true si el 'profile' dado es de un usuario amigo del usuario autentificado
  def is_friend_profile?(profile)
    if current_user.present?
      profile_user = profile.user
      return Friendship.are_friends?(current_user, profile_user)
    else
      return false
    end


  end
=end
end
