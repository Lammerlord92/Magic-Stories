class UserController < ApplicationController

  def index

   # @q = params[:q]
    #query = 'username => ? OR name => ? OR surname1 => ? OR surname2 => ? OR email => ?'
    #if @q
     # @users = User.where(query, @q)
    #else
     # @users = User.all
    #end

    @q = params[:q]
    query = 'username like ? OR name like ? OR surname1 like ? OR surname2 like ? OR email like ? '
    if @q
      @users = User.where(query, "%#{@q}%", "%#{@q}%", "%#{@q}%", "%#{@q}%", "%#{@q}%")
      if @users.blank?
        flash.alert = "User Not found"
      end
    else
      @users = User.all
    end


  end

end
