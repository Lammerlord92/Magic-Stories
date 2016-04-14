class MakerController < ApplicationController
  def sample
    render 'pruebas_maker/sample'
  end

  def show
    @id = params[:id]
    #@auxMaker = AuxMaker.new
    #@auxMaker.storyId = @id
    render 'welcome/maker'
  end

  def save
    #TODO
  end

end