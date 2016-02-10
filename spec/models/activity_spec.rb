require 'rails_helper'

RSpec.describe Activity, :type => :model do
  it "has a valid factory" do
    activity = FactoryGirl.build(:activity)
    expect(activity).to be_valid
  end

  it "is invalid without a title" do
    activity = FactoryGirl.build(:activity, title: nil)
    expect(activity).to_not be_valid
  end

  it "is invalid without a description" do
    activity = FactoryGirl.build(:activity, description: nil)
    expect(activity).to_not be_valid
  end
end
