require "rails_helper"

RSpec.describe MyPokemon, type: :model do
  let(:my_pokemon) { create(:my_pokemon) }

  describe "MyPokemon validation" do
    it "shows my_pokemon is valid" do
      expect(my_pokemon).to be_valid
    end
  end
end
