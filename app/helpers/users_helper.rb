module UsersHelper
  def email_errors
    if @user.errors.any?
      raw "<span class=\"errors\">Email #{@user.errors[:email].first}</span>"
    end
  end

  def password_errors
    if @user.errors.any?
      raw "<span class=\"errors\">Password #{@user.errors[:password].first}</span>"
    end
  end
end
