class WelcomeController < ApplicationController
  def index
    if params[:ingeniero] == 'true'
      render 'rc'
    else
      render 'index'
    end
  end

  def index2
    render :layout => nil
  end

  def popup
  end
end
