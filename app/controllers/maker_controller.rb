class MakerController < ApplicationController
  def sample
    render 'pruebas_maker/sample'
  end

  def show
    @id = params[:id]

    render 'welcome/maker'
  end
end