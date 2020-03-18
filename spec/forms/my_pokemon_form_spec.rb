require "rails_helper"

RSpec.describe MyPokemonForm, type: :model do
  let(:my_pokemon) { create(:my_pokemon) }

  describe "MyPokemon validation" do
    it "shows my_pokemon is valid" do
      expect(my_pokemon).to be_valid
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
end
