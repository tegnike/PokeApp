require "rails_helper"

RSpec.describe MyPokeItem, type: :model do
  let(:my_poke_item) { create(:my_poke_item) }

  describe "MyPokeItem validation" do
    it "shows my_poke_item is valid" do
      expect(my_poke_item).to be_valid
    end
  end
end
