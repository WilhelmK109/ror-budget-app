class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[show edit update destroy]
  before_action :set_categories, only: %i[new create]

  def index
    @expenses = Expense.all
  end

  def show; end

  def new
    @expense = Expense.new
    @categories = Category.where(author_id: current_user.id) || []
    @category_id = params[:category_id].to_i
  end

  def edit; end

  def create
    @expense = Expense.new(expense_params)

    if @expense.save
      category_ids = params[:expense][:category_ids].reject(&:empty?).map(&:to_i)
      @expense.categories << Category.where(id: category_ids)
      category = Category.find(category_ids.first)
      redirect_to user_category_path(current_user, category), notice: 'Transaction was successfully created.'
    else
      render :new
    end
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def set_categories
    @categories = current_user.categories
  end

  def expense_params
    params.require(:expense).permit(:name, :amount, :category_ids, category_ids: []).merge(author_id: current_user.id)
  end
end
