#module Api
class OptionsController < ApplicationController
  respond_to :json, only: [:create,:update,:destroy]

  def create
    @option = Option.new(option_params)
    respond_to do |format|
      if @option.save
        format.json { render json: @option.reload, status: :ok }
      else
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @option = option_find
    if !@option
      render json: {error: "Error: No existe la opción con id #{@option.id}"},
             status: :unprocessable_entity
    else if @option.update(option_params)
           render json: @option.reload, status: :ok
         else
           render json: @option.errors, status: :unprocessable_entity
         end
    end

#     redirect_to_maker_view
  end

  def destroy
    @option=option_find
    if !@option
      render json: {error: "Error: No existe la opción con id #{@option.id}"},
             status: :unprocessable_entity
    else if @option.destroy
           render json:{message: "Destruido con éxito la opción"}, status: :ok
         else
           render json: @option.errors, status: :unprocessable_entity
         end
    end
  end

  private
  def option_find
    @option = Option.find(params[:chapter][:id])
  end

  def option_params
    params
        .require(:chapter)
        .permit(
            :child_id,
            :parent_id,
            :option
        )
  end
=begin
    def convert_from_json
      @option.parent =params[:chapter][:from],
      @option.child=params[:chapter][:to],
      @option.option=params[:chapter][:title]
    end
=end
end

#end