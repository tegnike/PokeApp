require "rails_helper"

RSpec.describe Pokemon, type: :model do
  let(:pokemon) { create(:pokemon) }

  describe "Pokemon validation" do
    it "shows pokemon is valid" do
      expect(pokemon).to be_valid
    end
  end
end
