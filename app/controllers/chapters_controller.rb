class ChaptersController < ApplicationController

  # GET /chapters/1.jsonº
  # GET /chapters/1.json{"id":2,"title":Capítulo 01,"body":Este es el texto del capítulo 01. Este capítulo no puede borrarse, ya que es el primer capítulo de tu historia. Puedes crear nuevos capítulos y enlaces mediante los botones de la izquierda.,"child_options":[{"child_id":3,"parent_id":2,"option":1985"}],"parent_options":[]}

  def show
    @chapter = Chapter.find(params[:id])
  end

  def create
    @chapter = Chapter.find_or_create_by({id: params[:chapter][:id]})

    @chapter.body = chapter_params[:body]
    @chapter.title = chapter_params[:title]
    @chapter.story_id = chapter_params[:story_id]

    respond_to do |format|
      if @chapter.save
        format.json { render action: 'show', status: :ok }
      else
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end

  end

  def create_options
    id = params[:chapter][:id]
    @chapter = Chapter.find(id)
    if !@chapter
      render json: {error: "Error: No existe el capitulo con id #{id}"},
             status: :unprocessable_entity
    else
      parents = chapter_params[:parent_options]
      if parents
        parents.map! do |parent|
          {child_id: id, parent_id: parent}
        end

        parents.map! do |parsed_parent|
          option = Option.find_or_initialize_by(parsed_parent)
          unless option.option
            option.option = "Conecta nodo #{parsed_parent[:child_id]} con #{parsed_parent[:parent_id]}"
          end
          unless option.save
            render json: @chapter.errors, status: :unprocessable_entity
          end
        end
      end

      children = chapter_params[:child_options]
      if children
        children.each_pair do |index, child|
          option = Option.find_or_initialize_by({child_id: child[:child_id], parent_id: child[:parent_id]})
          option.assign_attributes child
          unless option.save
            render json: @chapter.errors, status: :unprocessable_entity
          end
        end
      end

      render action: 'show', status: :ok

    end
  end

  private
    def chapter_params
      params
          .require(:chapter)
          .permit(
              {child_options: [:option, :child_id, :parent_id]},
              :story_id,
              :body,
              :title,
              :id,
              parent_options: []
          )
    end

end
