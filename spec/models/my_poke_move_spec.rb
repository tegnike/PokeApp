require "rails_helper"

RSpec.describe MyPokeMove, type: :model do
  let(:my_pokemon) { create(:my_pokemon) }
  let(:my_poke_move) { create(:my_poke_move) }

  describe "MyPokeMove validation" do
    it "shows my_poke_move is valid" do
      expect(my_poke_move).to be_valid
    end
  end

  describe "has_less_four_moves?" do
    context "a my_pokemon has 4 moves" do
      subject {
        5.times do
          create(:my_poke_move, my_pokemon: my_pokemon)
          my_pokemon.reload
        end
      }
      it "shows valid" do
        expect { subject }.not_to raise_error ActiveRecord::RecordInvalid
      end
    end
    context "a my_pokemon has 5 moves" do
      subject {
        6.times do
          create(:my_poke_move, my_pokemon: my_pokemon)
          my_pokemon.reload
        end
      }
      it "shows invalid" do
        expect { subject }.to raise_error ActiveRecord::RecordInvalid
      end
    end
  end
end
