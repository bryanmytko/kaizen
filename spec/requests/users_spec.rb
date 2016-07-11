require 'rails_helper'

describe "Users", type: :request do
  describe "GET #new" do
    it "responds with a 200 ok" do
      get "/signup"
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    let(:valid_request) do
      post "/users", params: {
        user: {
          email: "test@test.com",
          password: "password123"
        }
      }
    end

    it "responds with a 302 redirected" do
      valid_request
      expect(response).to have_http_status(302)
    end
  end
end
