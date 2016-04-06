class WelcomeController < ApplicationController
  def index
=begin
     HAY QUE CONTROLAR QUE SI NO ESTA ACTIVA UNA SESIÓN SE MUESTRE EXCLUSIVAMENTE EL LOGIN
          QUE ES LA VISTA DEL sessions/new.html.erb DEL DEVISE


=end

  if !user_signed_in?
    redirect_to "/user/sign_in"
  else
    @story = Story.first # Temporalmente para pruebas del index
    @categories = Category.all
    render 'index'
  end

  # private

  # def require_login
  #   unless current_user
  #     redirect_to "/user/sign_in
  #   end
  # end

  end
end

