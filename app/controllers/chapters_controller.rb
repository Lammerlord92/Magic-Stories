class ChaptersController < ApplicationController
  #protect_from_forgery with: :null_session
  # GET /chapters/1.jsonº
  # GET /chapters/1.json{"id":2,"title":Capítulo 01,"body":Este es el texto del capítulo 01. Este capítulo no puede borrarse, ya que es el primer capítulo de tu historia. Puedes crear nuevos capítulos y enlaces mediante los botones de la izquierda.,"child_options":[{"child_id":3,"parent_id":2,"option":1985"}],"parent_options":[]}
  respond_to :json, only: [:create,:update,:destroy]
  def show
    begin
      @chapter = Chapter.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render 'errors/not_found'
    end
  end

  def create
    @chapter = Chapter.new(chapter_params)

    respond_to do |format|
      if @chapter.save
        format.json { render json: @chapter.reload, status: :ok }
      else
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @chapter = chapter_find
    if !@chapter
      render json: {error: "Error: No existe el capitulo con id #{@chapter.id}"},
             status: :unprocessable_entity
    else if @chapter.update(chapter_params)
           render json: @chapter.reload, status: :ok
         else
           render json: @chapter.errors, status: :unprocessable_entity
         end
    end

  end
  def destroy
    @chapter=chapter_find
    if !@chapter
      render json: {error: "Error: No existe el capitulo con id #{@chapter.id}"},
             status: :unprocessable_entity
    else if @chapter.destroy
           render json:{message: "Destruido con éxito el capítulo"}, status: :ok
         else
           render json: @chapter.errors, status: :unprocessable_entity
         end
    end
  end

  private
  def chapter_find
    @chapter = Chapter.find(params[:chapter][:id])
  end

  def redirect_to_maker_view
    redirect_to controller: 'maker_controller', action: 'show', id: params[:story_id]
  end

  def chapter_params
    params
        .require(:chapter)
        .permit(
            :title,
            :body,
            :story_id
        )
  end
=begin
  def convert_from_json
    @chapter.id = params[:chapter][:id],
    @chapter.body = params[:chapter][:title],
    @chapter.title=params[:chapter][:label],
    @chapter.story_id=params[:chapter][:story_id]
  end
=end
end
