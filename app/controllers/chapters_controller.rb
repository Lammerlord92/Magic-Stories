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
           format.json { render json: @chapter.reload, status: :ok }
         else
           format.json { render json: @chapter.errors, status: :unprocessable_entity }
         end
    end

#    redirect_to_maker_view
  end
  def destroy
    @chapter=chapter_find
    if !@chapter
      render json: {error: "Error: No existe el capitulo con id #{@chapter.id}"},
             status: :unprocessable_entity
    else if @chapter.destroy
           format.json { render json:{message: "Destruido con éxito el capítulo con id: #{@chapter.id}"}, status: :ok }
         else
           format.json { render json: @chapter.errors, status: :unprocessable_entity }
         end
    end
  end

=begin
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
=end
=begin
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
=end

  private
    def chapter_find
      @chapter = Chapter.find(params[:id])
    end

    def redirect_to_maker_view
      redirect_to controller: 'maker_controller', action: 'show', id: params[:story_id]
    end

    def chapter_params
      params
          .require(:chapter)
          .permit(
              :id,
              :body,
              :title,
              :story_id
          )
    end

end
