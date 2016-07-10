require 'rails_helper'

describe "Activities" do
  describe "GET #index" do
    context "when the user is logged in" do
      before(:each) { sign_in_as_a_valid_user }

      it "responds with a 200 ok" do
        get "/activities"
        expect(response).to have_http_status(200)
      end
    end

    context "when a user is not logged in" do
      it "redirects to the login page" do
        get "/activities"
        expect(response).to redirect_to(signup_path)
      end
    end
  end

  describe "GET #show" do
    let(:activity) { FactoryGirl.create(:activity) }

    context "when the user is logged in" do
      before(:each) { sign_in_as_a_valid_user }

      it "responds with a 200 ok" do
        get "/activities/#{activity.id}"
        expect(response).to have_http_status(200)
      end
    end

    context "when a user is not logged in" do
      it "redirects to the login page" do
        get "/activities/#{activity.id}"
        expect(response).to redirect_to(signup_path)
      end
    end
  end

  describe "GET #new" do
    context "when the user is logged in" do
      before(:each) { sign_in_as_a_valid_user }

      it "renders the new page" do
        get "/activities/new"
        expect(response).to have_http_status(200)
      end
    end

    context "when a user is not logged in" do
      it "redirects to the login page" do
        get "/activities/new"
        expect(response).to redirect_to(signup_path)
      end
    end
  end
end
