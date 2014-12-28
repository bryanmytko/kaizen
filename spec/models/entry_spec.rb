require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe "valid entry" do
    let(:entry) { Entry.new(type_of: "programming") }

    it "can create an entry of a specified type" do
      expect(entry.type_of).to eq("programming")
    end
  end
end
