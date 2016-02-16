class CategoriesController < ApplicationController
  def index
    @category=Category.all
  end

  def show
    @category=Category.find(params[:id])
  end

  def new
    @category=Category.new
  end

  def edit
    @category=Category.find(params[:id])
  end

  def create
    @category= Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to @category
    else
      render :edit
    end
  end

  def destroy
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
