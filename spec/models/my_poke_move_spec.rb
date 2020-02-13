require "rails_helper"

RSpec.describe MyPokeMove, type: :model do
  let(:my_pokemon) { create(:my_pokemon) }
  let(:my_poke_move) { create(:my_poke_move) }

  describe "MyPokeMove validation" do
    it "shows my_poke_move is valid" do
      expect(my_poke_move).to be_valid
    end
  end
end
