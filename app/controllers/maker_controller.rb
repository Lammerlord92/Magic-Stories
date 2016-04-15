class MakerController < ApplicationController
  def show
    @storyId= params[:id]
    render 'welcome/maker'
  end

end