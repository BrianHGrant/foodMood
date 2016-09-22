class FoodsController < ApplicationController

  before_action :authenticate_user!
  helper_method :sort_column, :sort_direction

  def index
    # @foods = Food.search(params[:search])
    if params[:search]
      @category = Category.search(params[:search]).first
      @foods = Food.where(category_id: @category.id)
    else
      @foods = Food.order(sort_column + " " + sort_direction)
    end
    # @foods = Food.order(sort_column + " " + sort_direction)
  end

  def show
    @food = Food.find(params[:id])
  end

  def edit
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
    @categories = Category.all
    @types = Type.all
  end

  def create
    @categories = Category.all
    @types = Type.all
    @food = current_user.foods.new(food_params)
    if @food.save
      flash[:notice] = "Food saved successfully"
      redirect_to new_mood_path
    else
      flash[:alert] = "Food failed to save"
      render :new
    end
  end

  def update
    @food = Food.find(params[:id])
    if @food.update(food_params)
      flash[:notice] = "Food updated"
      redirect_to food_path(@food)
    else
      flash[:alert] = "Food update failed"
      redirect_to food_path(@food)
    end
  end

  def destroy
    @food = Food.find(params[:id])
    if @food.delete
      flash[:notice] = "Food deleted"
      redirect_to foods_path
    else
      flash[:alert] = "Food failed to delete"
    end
  end
  private

  def sort_column
    Food.column_names.include?(params[:sort]) ? params[:sort] : "time_consumed"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def food_params
    params.require(:food).permit(:category_id, :type_id, :time_consumed)
  end

end
