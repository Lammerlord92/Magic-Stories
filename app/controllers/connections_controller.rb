class ConnectionsController < ApplicationController
  include ConnectionsHelper
  before_action :authenticate_user!



  def search
    choice = params[:choice]
    if choice == nil
      choice =''
    end


    @q = params[:q]  # Tenemos en cuenta el hacking SQL Injection

    if @q
      @q = @q.downcase
    else
      @q = ''
    end


    # 1  = Followers
    # 2  = Followees
    # 3  = Friends
    # else = All

    @profiles = case choice
    when 'followers' then
      searchFollowers(@q)
    when 'followees' then
      searchFollowees(@q)
    when 'friends' then
      searchFriends(@q)
    else
      current_user.profile.followees(Profile)
    end

    if @profiles.blank?
      flash.alert = "Ningún perfil encontrado con sus parámetros de búsqueda"
    end

  end




end
