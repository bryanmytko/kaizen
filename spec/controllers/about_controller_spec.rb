require 'rails_helper'

describe AboutController do
  describe "#index" do
    it "renders the about page" do
      get :index
      expect(response).to render_template :index
    end
  end
end
