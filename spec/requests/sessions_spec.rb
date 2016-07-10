require 'rails_helper'

describe "Sessions" do
  describe "GET #index" do
    context "when user is logged in" do
      before(:each) { sign_in_as_a_valid_user }

      it "is successful" do
        get "/"
        expect(session).to_not be_empty
        expect(response).to have_http_status(302)
      end
    end

    context "when user is not logged in" do
      it "redirects the user" do
        get "/"
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "GET #logout" do
    before(:each) { sign_in_as_a_valid_user }

    it "logs the user out" do
      get "/logout"
      expect(response).to redirect_to(login_path)
    end
  end

  describe "POST login" do
    context "when a user is valid" do
      let(:password) { "password" }
      let(:user){ FactoryGirl.create(:user, password: password) }

      it "logs a user in" do
        post "/login", params: {
          session: {
            email: user.email,
            password: password
          }
        }
        expect(response).to redirect_to(root_path)
      end
    end

    context "when a user is not valid" do
      it "it displays an error" do
        post "/login", params: {
          session: {
            email: "invalid@invalid.com",
            password: "password123"
          }
        }
        expect(flash[:error]).to_not be_empty
      end
    end
  end
end
