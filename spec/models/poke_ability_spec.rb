require "rails_helper"

RSpec.describe PokeAbility, type: :model do
  let(:pokemon) { create(:pokemon) }
  let(:poke_ability) { create(:poke_ability) }

  describe "PokeAbility validation" do
    it "shows poke_ability is valid" do
      expect(poke_ability).to be_valid
    end
  end

  describe "abilities number validation" do
    context "a pokemon has 3 abilities" do
      subject {
        3.times do
          create(:poke_ability, pokemon: pokemon)
          pokemon.reload
        end
      }
      it "shows pokemon is valid" do
        expect { subject }.not_to raise_error ActiveRecord::RecordInvalid
      end
    end
    context "a pokemon has 4 abilities" do
      subject {
        4.times do
          create(:poke_ability, pokemon: pokemon)
          pokemon.reload
        end
      }
      it "shows pokemon is invalid" do
        expect { subject }.to raise_error ActiveRecord::RecordInvalid
      end
    end
  end
end
