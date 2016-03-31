class CategoriesController < ApplicationController
  def index
    @categories=Category.all
  end

  def show
    @category=set_category
  end

  def new
    @category=Category.new
  end

  def edit
    @category=set_category
  end

  def create
    #if check_category_name{
 #   @category.errors.add("El nombre ya esta en uso")
# render :new
# }else{
    @category= Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render :new
    end
#    }
  end

  def update
        @category=set_category
        if @category.update_attributes!(category_params)
          redirect_to @category
        else
          render :edit
        end
  end

  def destroy
    @category=set_category
    @category.destroy
    redirect_to categories_path
  end

  private

  def set_category
    @category=Category.find(params[:id])
  end

  def category_params
     params.require(:category).permit(:name,:description,:icon)
  end
end
