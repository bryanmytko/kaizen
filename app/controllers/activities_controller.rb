class ActivitiesController < ApplicationController
  helper :activities

  def index
    @activities = Activity.all.includes(:entries)
  end

  def show
    @activity = Activity.find(params[:id]).includes(:entries)
  end

  def create
  end

  def update
  end

  def destroy
  end
end
