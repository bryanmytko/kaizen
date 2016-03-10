require 'rails_helper'

describe ActivitiesController do
  describe "GET #index" do
    context "when the user is logged in" do
      let(:user) { user = FactoryGirl.create(:user) }
      before { allow(controller).to receive(:current_user) { user } }

      it "responds with a 200 ok" do
        get :index
        expect(response).to have_http_status(200)
      end

      it "shows all activities" do
        a1 = FactoryGirl.create(:activity, user: user)
        a2 = FactoryGirl.create(:activity, user: user)

        get :index
        expect(assigns(:activities)).to match_array([a1, a2])
      end
    end

    context "when a user is not logged in" do
      it "redirects to the login page" do
        get :index
        expect(response).to redirect_to(signup_path)
      end
    end
  end

  describe "GET #show" do
    let(:activity) { FactoryGirl.create(:activity) }

    context "when the user is logged in" do
      let(:user) { user = FactoryGirl.create(:user) }
      before { allow(controller).to receive(:current_user) { user } }

      it "responds with a 200 ok" do
        get :show, id: activity.id
        expect(response).to have_http_status(200)
      end

      it "shows a single activity" do
        a1 = FactoryGirl.create(:activity)
        get :show, id: activity.id
        expect(assigns(:activity)).to eq(activity)
      end
    end

    context "when a user is not logged in" do
      it "redirects to the login page" do
        get :show, id: activity.id
        expect(response).to redirect_to(signup_path)
      end
    end
  end

  describe "GET #new" do
    context "when the user is logged in" do
      let(:user) { user = FactoryGirl.create(:user) }
      before { allow(controller).to receive(:current_user) { user } }

      it "renders the new page" do
        get :new
        expect(response).to render_template(:new)
      end
    end

    context "when a user is not logged in" do
      it "redirects to the login page" do
        get :new
        expect(response).to redirect_to(signup_path)
      end
    end
  end

  describe "POST #create" do
    context "when the user is logged in" do
      let(:user) { user = FactoryGirl.create(:user) }
      before { allow(controller).to receive(:current_user) { user } }

      it "creates a new activity" do
        post :create, { activity: { title: "test", description: "test" } }
        expect(Activity.count).to eq(1)
      end
    end

    context "when a user is not logged in" do
      it "redirects to the login page" do
        post :create
        expect(response).to redirect_to(signup_path)
      end
    end
  end
end
