require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe "User validation" do
    it "shows user is valid" do
      expect(user).to be_valid
    end
  end
end
