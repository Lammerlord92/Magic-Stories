class ChaptersController < ApplicationController
  before_action :authenticate!
  # GET /chapters/1.json
  def show
    @chapter = Chapter.find(params[:id])
  end

end
