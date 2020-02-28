require "rails_helper"

RSpec.describe Ability, type: :model do
  let(:ability) { create(:ability) }

  describe "Ability validation" do
    it "shows ability is valid" do
      expect(ability).to be_valid
    end
  end
end
