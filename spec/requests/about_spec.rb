require 'rails_helper'

describe "About" do
  it "renders the about page" do
    get "/about"
    expect(response).to have_http_status(302)
  end
end
