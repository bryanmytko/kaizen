class ActivitiesController < ApplicationController
  helper :activities
  before_action :validate_user

  def index
    @activities = Activity.includes(:entries).where(user_id: current_user.id)
    @entry = Entry.new
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

  def validate_user
    redirect_to signup_path unless current_user
  end
end
