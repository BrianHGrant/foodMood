class FoodsController < ApplicationController
  before_action :authenticate_user!
def index
  @foods = Food.order(:time_consumed)
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
    redirect_to foods_path
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
def food_params
  params.require(:food).permit(:category_id, :type_id, :time_consumed)
end

end
