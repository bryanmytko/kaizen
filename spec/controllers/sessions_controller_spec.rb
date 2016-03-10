require 'rails_helper'

describe SessionsController do
  describe "GET #index" do
    it "renders the login page (index)" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #logout" do
    it "logs the user out" do
      get :logout
      expect(response).to redirect_to(login_path)
      expect(session).to be_empty
    end
  end

  describe "POST login" do
    context "when a user is valid" do
      let(:password) { "password" }
      let(:user){ FactoryGirl.create(:user, password: password) }

      it "logs a user in" do
        post :login, { session: { email: user.email, password: password } }
        expect(response).to redirect_to(root_path)
      end
    end

    context "when a user is not valid" do
      it "it displays an error" do
        post :login, {
          session: {
            email: "invalid@invalid.com",
            password: "password123"
          }
        }
        expect(flash).to_not be_empty
        expect(response).to render_template(:index)
      end
    end
  end
end
