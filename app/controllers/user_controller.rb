class UserController < ApplicationController

  def index

    @q = params[:q]
    query = 'title => ? OR description => ? OR price => ? OR language => ?'
    if @q
      @users = User.where(query, @q)
    else
      @users = User.all
    end
  end
end
