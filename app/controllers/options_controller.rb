class OptionController < ApplicationController
  respond_to :json, only: [:create,:update,:destroy]

  def create
    @option = Option.new(option_params)
    @option.save
  end

  def update
    @option = option_find
    if !@option
      render json: {error: "Error: No existe la opción con id #{id}"},
             status: :unprocessable_entity
    else
      format.json { render json: @option.errors, status: :unprocessable_entity }
    end
    @option.update(option_params)
#    redirect_to_maker_view
  end

  def destroy
    @option=option_find
    @option.destroy
    #   redirect_to_maker_view
  end

  private
  def option_find
    @option = Option.find(params[:id])
  end

  def option_params
    params
        .require(:chapter)
        .permit(
            :id,
            :parent_id,
            :child_id,
            :option
        )
  end

end