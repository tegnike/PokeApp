require "rails_helper"

RSpec.describe MyPokeAbility, type: :model do
  let(:my_poke_ability) { create(:my_poke_ability) }

  describe "MyPokeAbility validation" do
    it "shows my_poke_ability is valid" do
      expect(my_poke_ability).to be_valid
    end
  end
end
