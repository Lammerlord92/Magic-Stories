class WelcomeController < ApplicationController
  def index
=begin
     HAY QUE CONTROLAR QUE SI NO ESTA ACTIVA UNA SESIÓN SE MUESTRE EXCLUSIVAMENTE EL LOGIN
          QUE ES LA VISTA DEL sessions/new.html.erb DEL DEVISE

    if !user_signed_in?
      redirect_to "new_user_session_path"
    else
=end
      render 'index'
    #end
  end
end
