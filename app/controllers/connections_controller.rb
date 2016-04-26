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

    a = case choice
    when 'followers' then
      [searchFollowers(@q), 'Seguidores']
    when 'followees' then
      [searchFollowees(@q), 'Siguiendo']
=begin t
    when 'friends' then
      [searchFriends(@q), 'Amigos']
=end
    else
      [current_user.profile.followees(Profile), 'Siguiendo']
    end

    @profiles = a[0]
    @t1 = a[1]

    if @profiles.blank?
      flash.now.alert = "Ningún perfil encontrado con sus parámetros de búsqueda"
    end

  end




end
