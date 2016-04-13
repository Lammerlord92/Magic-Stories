class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories=Category.all
  end

  def show
    begin
      @category=set_category
    rescue ActiveRecord::RecordNotFound => e
      render 'errors/not_found'
    end
  end

  def new
    @category=Category.new
  end

  def edit
    @category=set_category
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
    @category=set_category
    if @category.update(category_params)
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
