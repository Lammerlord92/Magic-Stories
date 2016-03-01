class ProfilesController < ApplicationController
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

end