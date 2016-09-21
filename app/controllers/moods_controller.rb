class MoodsController < ApplicationController
  before_action :authenticate_user!
  def index
    @moods = Mood.order(:time)
  end
  def show
    @mood = Mood.find(params[:id])
  end
  def edit
    @mood = Mood.find(params[:id])
  end
  def new
    @mood = Mood.new
  end
  def create
    @mood = current_user.moods.new(mood_params)
    if @mood.save
      flash[:notice] = "Mood saved successfully"
      redirect_to new_mood_path
    else
      flash[:alert] = "Mood failed to save"
      render :new
    end
  end
  def update
    @mood = Mood.find(params[:id])
    if @mood.update(mood_params)
      flash[:notice] = "Mood updated"
      redirect_to mood_path(@mood)
    else
      flash[:alert] = "Mood update failed"
      redirect_to mood_path(@mood)
    end
  end
  def destroy
    @mood = Mood.find(params[:id])
    if @mood.delete
      flash[:notice] = "Mood deleted"
      redirect_to moods_path
    else
      flash[:alert] = "Mood failed to delete"
    end
  end
  private
  def mood_params
    params.require(:mood).permit(:time, :level)
  end
end
