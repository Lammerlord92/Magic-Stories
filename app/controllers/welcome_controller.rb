class WelcomeController < ApplicationController
  before_filter :require_login
  def index
=begin
     HAY QUE CONTROLAR QUE SI NO ESTA ACTIVA UNA SESIÓN SE MUESTRE EXCLUSIVAMENTE EL LOGIN
          QUE ES LA VISTA DEL sessions/new.html.erb DEL DEVISE

    if !user_signed_in?
      redirect_to "new_user_session_path"
    else
=end


      @story = Story.first # Temporalmente para pruebas del index
      @categories = Category.all
      render 'index'
  end
  private

  def require_login
    unless current_user
      redirect_to "new_user_session_path"
    end
  end

end
