require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "responds with a 200 ok" do
      get :new
      expect(response).to have_http_status(200)
    end

    it "initializes a new user" do
      get :new
      expect(assigns(:user)).to be_a(User)
    end
  end

  describe "POST #create" do
    let(:valid_request) do
      post :create, { user: { email: "test@test.com", password: "password123" } }
    end

    it "responds with a 302 redirected" do
      valid_request
      expect(response).to have_http_status(302)
    end

    it "creates a new user" do
      valid_request
      expect(assigns(:user)).to be_valid
      expect(assigns(:user)).to be_a(User)
    end
  end
end
