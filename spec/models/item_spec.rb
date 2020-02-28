require "rails_helper"

RSpec.describe Item, type: :model do
  let(:item) { create(:item) }

  describe "Item validation" do
    it "shows item is valid" do
      expect(item).to be_valid
    end
  end
end
