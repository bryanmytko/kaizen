require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    user = FactoryGirl.build(:user)
    expect(user).to be_valid
  end

  it "is invalid with a short password" do
    user = FactoryGirl.build(:user, password: "123")
    expect(user).to be_invalid
  end

  it "is invalid without a password" do
    user = FactoryGirl.build(:user, password: nil)
    expect(user).to be_invalid
  end

  it "is invalid with a non-unique email" do
    existing_user = FactoryGirl.create(:user)
    new_user = FactoryGirl.build(:user, email: existing_user.email)

    expect(new_user).to be_invalid
  end

  it "is invalid withouth a proper email" do
    user = FactoryGirl.build(:user, email: "foo")
    expect(user).to be_invalid
  end

  it "is invalid withouth an email" do
    user = FactoryGirl.build(:user, email: nil)
    expect(user).to be_invalid
  end
end
