class ActivitiesController < ApplicationController
  helper :activities

  def index
    if current_user
      @activities = Activity.includes(:entries).where(user_id: current_user.id)
      @entry = Entry.new
    else
      redirect_to signup_path
    end
  end

  def show
    @activity = Activity.includes(:entries).find(params[:id])
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user

    if @activity.save
      redirect_to activities_path
    else
      render :new
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :description)
  end
end
