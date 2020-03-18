require "rails_helper"

RSpec.describe MyPokemonForm, type: :model do
  before {
    user = create(:user)
    create(:pokemon, full_name: "テストポケモン")
    create(:ability, ability: "テスト特性")
    create(:item, item: "テストアイテム")
    (1..4).each do |n|
      create(:move, move: "テストわざ#{n}")
    end
    @my_pokemon_form = MyPokemonForm.new(
      user_id: user.id,
      name: "テストポケモン",
      ability: "テスト特性",
      status_up: "0",
      status_down: "2",
      item: "テストアイテム",
      ev_h: 4, ev_a: 252, ev_b: 0, ev_c: 0, ev_d: 0, ev_s: 252,
      iv_h: "31", iv_a: "31", iv_b: "31", iv_c: "", iv_d: "31", iv_s: "31",
      move_1: "テストわざ1", move_2: "テストわざ2",
      move_3: "テストわざ3", move_4: "テストわざ4",
      role: "テスト役割"
    )
  }
  describe "MyPokemon validation" do
    it "shows my_pokemon is valid" do
      expect(@my_pokemon_form).to be_valid
    end
  end

  describe "columns validation" do
    describe "presence" do
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_presence_of :ability }
      it { is_expected.to validate_presence_of :status_up }
      it { is_expected.to validate_presence_of :status_down }
      it { is_expected.to validate_presence_of :item }
      it { is_expected.to validate_presence_of :move_1 }
    end
    describe "number size" do
      it { should validate_numericality_of(:ev_h).is_less_than_or_equal_to(252) }
      it { should validate_numericality_of(:ev_a).is_less_than_or_equal_to(252) }
      it { should validate_numericality_of(:ev_b).is_less_than_or_equal_to(252) }
      it { should validate_numericality_of(:ev_c).is_less_than_or_equal_to(252) }
      it { should validate_numericality_of(:ev_d).is_less_than_or_equal_to(252) }
      it { should validate_numericality_of(:ev_s).is_less_than_or_equal_to(252) }
      it { should validate_numericality_of(:iv_h).is_less_than_or_equal_to(31) }
      it { should validate_numericality_of(:iv_a).is_less_than_or_equal_to(31) }
      it { should validate_numericality_of(:iv_b).is_less_than_or_equal_to(31) }
      it { should validate_numericality_of(:iv_c).is_less_than_or_equal_to(31) }
      it { should validate_numericality_of(:iv_d).is_less_than_or_equal_to(31) }
      it { should validate_numericality_of(:iv_s).is_less_than_or_equal_to(31) }
    end
    describe "characters" do
      it { should validate_length_of(:role).is_at_most(20) }
    end
  end

  describe "save" do
    it "shows save method true" do
      expect(@my_pokemon_form.save).to be_truthy
    end
  end

  describe "integer_string?(str)" do
    it "shows correct result" do
      @my_pokemon_form.save
      my_pokemon = MyPokemon.find_by(role: "テスト役割")
      expect(my_pokemon.iv_a).to eq "31"
      expect(my_pokemon.iv_c).to eq nil
    end
  end

  describe "get_status(status)" do
    it "shows correct status" do
      @my_pokemon_form.save
      my_pokemon = MyPokemon.find_by(role: "テスト役割")
      expect(my_pokemon.status_up).to eq "A"
      expect(my_pokemon.status_down).to eq "C"
    end
  end

  describe "calc_av(pokemon)" do
    it "shows correct calculation" do
      @my_pokemon_form.save
      my_pokemon = MyPokemon.find_by(role: "テスト役割")
      expect(my_pokemon.av_h).to eq 156
      expect(my_pokemon.av_a).to eq 145
      expect(my_pokemon.av_b).to eq 100
      expect(my_pokemon.av_c).to eq nil
      expect(my_pokemon.av_d).to eq 100
      expect(my_pokemon.av_s).to eq 132
    end
  end
end
