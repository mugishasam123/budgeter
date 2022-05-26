class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories
  end

  def show
    @category = Category.find(params[:id])
    authorize! :read, @category
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path, notice: "Category #{@category.name} was successfully created!"
    else
      redirect_to new_category_path, notice: 'Category could not be created!'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :user_id, :icon)
  end
end
