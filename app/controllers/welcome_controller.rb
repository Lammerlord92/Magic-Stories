class WelcomeController < ApplicationController
  def index
    if params[:ingeniero] == 'true'
      render 'rc'
    else
      render 'index'
    end
  end

  def popup
  end
end
