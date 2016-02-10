require 'rails_helper'

RSpec.describe Entry, :type => :model do
  it "has a valid factory" do
    entry = FactoryGirl.build(:entry)
    expect(entry).to be_valid
  end

  it "is invalid without an activity" do
    entry = FactoryGirl.build(:entry, activity: nil)
    expect(entry).to_not be_valid
  end
end
