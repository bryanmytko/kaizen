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
end
