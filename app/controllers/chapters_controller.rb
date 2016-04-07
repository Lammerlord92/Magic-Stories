class ChaptersController < ApplicationController
  # GET /chapters/1.json
  def show
    @chapter = Chapter.find(params[:id])
  end

end
