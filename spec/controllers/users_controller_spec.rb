require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET #show" do
    let(:user) { create(:user) }
    before { get :show, params: { id: user.id } }
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end
end
