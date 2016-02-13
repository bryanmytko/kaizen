class SessionsController < ApplicationController
  def index
  end

  def login
    @user = User.find_by(email: session_params[:email])

    if @user && @user.is_password?(session_params[:password])
      session[:current_user_id] = @user.id
      redirect_to activities_path
    else
      render text: "Invalid Email/Password"
    end
  end

  def logout
    session.delete(:current_user_id)
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
