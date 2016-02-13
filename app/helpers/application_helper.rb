module ApplicationHelper
  SITE_TITLE = "Kaizen かいぜん"

  def logged_in?
    session[:current_user_id]
  end
end
