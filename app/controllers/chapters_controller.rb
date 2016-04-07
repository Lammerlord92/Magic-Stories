class ChaptersController < ApplicationController

  # GET /chapters/1.jsonº
  # GET /chapters/1.json{"id":2,"title":Capítulo 01,"body":Este es el texto del capítulo 01. Este capítulo no puede borrarse, ya que es el primer capítulo de tu historia. Puedes crear nuevos capítulos y enlaces mediante los botones de la izquierda.,"child_options":[{"child_id":3,"parent_id":2,"option":1985"}],"parent_options":[]}

  def show
    @chapter = Chapter.find(params[:id])
  end

  def create
    @chapter = Chapter.new(chapter_params)

    respond_to do |format|
      if @chapter.save
        format.json { render action: 'show', status: :ok }
      else
        format.json {render json: @chapter.errors, status: :unprocessable_entity }
      end
    end

  end

  private
    def chapter_params
      params.require(:chapter).permit('child_options', 'body', 'title', 'id', 'parent_options')
    end

end
