require "rails_helper"

RSpec.describe MyPokemon, type: :model do
  describe "MyPokemon validation" do
    it "shows my_pokemon is valid" do
      my_pokemon = create(:my_pokemon)
      expect(my_pokemon).to be_valid
    end
  end

  describe "pokemon_full_name" do
    let(:pokemon) { create(:pokemon, full_name: "ロトム（ウォッシュ）") }
    it "gets pokemon's full_name" do
      my_pokemon = create(:my_pokemon, pokemon: pokemon)
      expect(my_pokemon.pokemon_full_name).to eq "ロトム（ウォッシュ）"
    end
  end

  describe "icon_32" do
    context "has form" do
      let(:pokemon) { create(:pokemon, number: 52, form: "g") }
      it "gets image url with form" do
        my_pokemon = create(:my_pokemon, pokemon: pokemon)
        expect(my_pokemon.icon_32).to eq "//sp.raky.net/pokemon/poke/icon32/n52g.gif"
      end
    end
    context "doesn't have form" do
      let(:pokemon) { create(:pokemon, number: 52) }
      it "gets image url without form" do
        my_pokemon = create(:my_pokemon, pokemon: pokemon)
        expect(my_pokemon.icon_32).to eq "//sp.raky.net/pokemon/poke/icon32/n52.gif"
      end
    end
  end

  describe "ability" do
    let(:my_pokemon) { create(:my_pokemon) }
    let(:ability) { create(:ability, ability: "ふゆう") }
    let!(:my_poke_ability) { create(:my_poke_ability, my_pokemon: my_pokemon, ability: ability) }
    it "gets pokemon's ability" do
      expect(my_pokemon.ability).to eq "ふゆう"
    end
  end

  describe "item" do
    let(:my_pokemon) { create(:my_pokemon) }
    let(:item) { create(:item, item: "こだわりハチマキ") }
    let!(:my_poke_item) { create(:my_poke_item, my_pokemon: my_pokemon, item: item) }
    it "gets pokemon's item" do
      expect(my_pokemon.item).to eq "こだわりハチマキ"
    end
  end

  describe "moves" do
    let(:my_pokemon) { create(:my_pokemon) }
    before {
      (0..3).each do |n|
        move = create(:move, move: "わざ#{n}")
        create(:my_poke_move, my_pokemon: my_pokemon, move: move)
        my_pokemon.reload
      end
    }
    it "gets pokemon's moves" do
      (0..3).each do |n|
        expect(my_pokemon.moves[n]).to eq "わざ#{n}"
      end
    end
  end

  describe "check_ev(ev)" do
    context "ev isn't 0" do
      let(:my_pokemon) { create(:my_pokemon, ev_h: 252) }
      it "gets ' (ev)'" do
        expect(my_pokemon.check_ev(my_pokemon.ev_h)).to eq " (252)"
      end
    end
    context "ev is 0" do
      let(:my_pokemon) { create(:my_pokemon, ev_h: 0) }
      it "doesn't get ' (ev)'" do
        expect(my_pokemon.check_ev(my_pokemon.ev_h)).to eq ""
      end
    end
  end

  describe "check_ivav(value)" do
    context "value isn't nil" do
      let(:my_pokemon) { create(:my_pokemon, iv_h: 31) }
      it "shows value" do
        expect(my_pokemon.check_ivav(my_pokemon.iv_h)).to eq "31"
      end
    end
    context "value is nil" do
      let(:my_pokemon) { create(:my_pokemon, iv_h: nil) }
      it "shows 'x'" do
        expect(my_pokemon.check_ivav(my_pokemon.iv_h)).to eq "x"
      end
    end
  end
end
