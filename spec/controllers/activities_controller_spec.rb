require 'rails_helper'

describe ActivitiesController, type: :controller do
  describe "GET #index" do
    it "responds with a 200 ok" do
      get :index
      expect(response).to have_http_status(200)
    end

    it "shows all activities" do
      a1 = FactoryGirl.create(:activity)
      a2 = FactoryGirl.create(:activity)

      get :index
      expect(assigns(:activities)).to match_array([a1, a2])
    end
  end

  describe "GET #show" do
    it "responds with a 200 ok" do
      a1 = FactoryGirl.create(:activity)
      get :show, id: a1.id
      expect(response).to have_http_status(200)
    end

    it "shows a single activity" do
      a1 = FactoryGirl.create(:activity)
      get :show, id: a1.id
      expect(assigns(:activity)).to eq(a1)
    end
  end
end
