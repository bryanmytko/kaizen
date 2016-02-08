class ActivitiesController < ApplicationController

  helper :activities

  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
  end
end
