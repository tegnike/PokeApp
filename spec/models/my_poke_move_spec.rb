require "rails_helper"

RSpec.describe MyPokeMove, type: :model do
  let(:my_pokemon) { create(:my_pokemon) }
  let(:my_poke_move) { create(:my_poke_move) }

  describe "MyPokeMove validation" do
    it "shows my_poke_move is valid" do
      expect(my_poke_move).to be_valid
    end
  end

  describe "moves number validation" do
    context "my pokemon has 4 moves" do
      subject {
        4.times do
          create(:my_poke_move, my_pokemon: my_pokemon)
          my_pokemon.reload
        end
      }
      it "doesn't occors error" do
        expect { subject }.not_to raise_error ActiveRecord::RecordInvalid
      end
    end
    context "my pokemon has 5 abilities" do
      subject {
        5.times do
          create(:my_poke_move, my_pokemon: my_pokemon)
          my_pokemon.reload
        end
      }
      it "occors error" do
        expect { subject }.to raise_error ActiveRecord::RecordInvalid
      end
    end
  end
end
