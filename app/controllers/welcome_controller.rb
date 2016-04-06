class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
=begin
     HAY QUE CONTROLAR QUE SI NO ESTA ACTIVA UNA SESIÓN SE MUESTRE EXCLUSIVAMENTE EL LOGIN
          QUE ES LA VISTA DEL sessions/new.html.erb DEL DEVISE


=end
    @story = Story.first # Temporalmente para pruebas del index
    @categories = Category.all
    render 'index'

  # private

  # def require_login
  #   unless current_user
  #     redirect_to "/user/sign_in
  #   end
  # end

  end
end

