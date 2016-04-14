class MakerController < ApplicationController
  def show
    @id = params[:id]
    render 'welcome/maker'
  end

end