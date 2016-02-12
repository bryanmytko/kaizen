class ActivitiesController < ApplicationController
  helper :activities

  def index
    @activities = Activity.includes(:entries).all
    @entry = Entry.new
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
