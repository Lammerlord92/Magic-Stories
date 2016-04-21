class MakerController < ApplicationController
  def show
    @id = params[:id]
    render 'maker/maker'
  end
end