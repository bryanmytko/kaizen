class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.errors.any?
      render :new
    else
      session[:current_user_id] = @user.id
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
