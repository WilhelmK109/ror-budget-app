class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.where(author_id: current_user.id).order(created_at: :desc) || []
  end

  def show
    @category = Category.includes(:entities).find(params[:id])
    @expenses = @category.expenses.order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)
    @category.author = current_user

    if @category.save
      redirect_to authenticated_root_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to authenticated_root_path, notice: 'Category was successfully destroyed.'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :icon).merge(author_id: current_user)
  end
end
