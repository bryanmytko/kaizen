class ActivitiesController < ApplicationController
  helper :activities

  def index
    if current_user
      @activities = Activity.includes(:entries).where(user_id: current_user.id)
      @entry = Entry.new
    else
      redirect_to root_path
    end
  end

  def show
    @activity = Activity.includes(:entries).find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
  end
end
