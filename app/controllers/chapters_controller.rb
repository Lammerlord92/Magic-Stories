class ChaptersController < ApplicationController
  # GET /chapters/1.jsonº
  def show
    @chapter = Chapter.find(params[:id])
  end

end
