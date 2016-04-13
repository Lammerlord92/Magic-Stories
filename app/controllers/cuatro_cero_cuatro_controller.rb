class CuatroCeroCuatroController < ApplicationController


  def index
    respond_to do |format|
      flash[:status] = request.path
      format.html { render 'errors/not_found' }
      format.all { render :nothing => true,:status => "404 Not Found" }
    end
  end
end
