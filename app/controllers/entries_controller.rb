class EntriesController < ApplicationController
  def index
  end

  def show
  end

  def create
    activity = Activity.find(params[:activity_id])
    entry = Entry.new(entry_params)
    entry.activity = activity

    if entry.save
      redirect_to root_path
    end
  end

  def update
  end

  def destroy
  end

  private

  def entry_params
    params.require(:entry).permit(:comment)
  end
end
