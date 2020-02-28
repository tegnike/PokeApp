require "rails_helper"

RSpec.describe Move, type: :model do
  let(:move) { create(:move) }

  describe "Move validation" do
    it "shows move is valid" do
      expect(move).to be_valid
    end
  end
end
