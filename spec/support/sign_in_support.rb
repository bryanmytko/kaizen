module ValidUserRequestHelper
  def sign_in_as_a_valid_user
    @user ||= FactoryGirl.create :user
    post(
      create_login_path,
      params: {
        session: {
          email: @user.email,
          password: @user.password
        }
      }
    )

  end
end
