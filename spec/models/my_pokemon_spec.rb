require 'rails_helper'

RSpec.describe MyPokemon, type: :model do
  let(:my_pokemon) { create(:my_pokemon) }

  describe "MyPokemon validation" do
    it "shows my_pokemon is valid" do
      expect(my_pokemon).to be_valid
    end
  end

  describe "Comment's columns validation" do
    describe "presence" do
      it { is_expected.to validate_presence_of :nature }
      it { is_expected.to validate_presence_of :ev_h }
      it { is_expected.to validate_presence_of :ev_a }
      it { is_expected.to validate_presence_of :ev_b }
      it { is_expected.to validate_presence_of :ev_c }
      it { is_expected.to validate_presence_of :ev_d }
      it { is_expected.to validate_presence_of :ev_s }
      it { is_expected.to validate_presence_of :iv_h }
      it { is_expected.to validate_presence_of :iv_a }
      it { is_expected.to validate_presence_of :iv_b }
      it { is_expected.to validate_presence_of :iv_c }
      it { is_expected.to validate_presence_of :iv_d }
      it { is_expected.to validate_presence_of :role }
    end
    describe "number size" do
      it { should validate_numericality_of(:ev_h).is_less_than_or_equal_to(31) }
      it { should validate_numericality_of(:ev_a).is_less_than_or_equal_to(31) }
      it { should validate_numericality_of(:ev_b).is_less_than_or_equal_to(31) }
      it { should validate_numericality_of(:ev_c).is_less_than_or_equal_to(31) }
      it { should validate_numericality_of(:ev_d).is_less_than_or_equal_to(31) }
      it { should validate_numericality_of(:ev_s).is_less_than_or_equal_to(31) }
      it { should validate_numericality_of(:iv_h).is_less_than_or_equal_to(252) }
      it { should validate_numericality_of(:iv_a).is_less_than_or_equal_to(252) }
      it { should validate_numericality_of(:iv_b).is_less_than_or_equal_to(252) }
      it { should validate_numericality_of(:iv_c).is_less_than_or_equal_to(252) }
      it { should validate_numericality_of(:iv_d).is_less_than_or_equal_to(252) }
      it { should validate_numericality_of(:iv_s).is_less_than_or_equal_to(252) }
    end
    describe "characters" do
      it { should validate_length_of(:role).is_at_most(20) }
    end
  end
end
