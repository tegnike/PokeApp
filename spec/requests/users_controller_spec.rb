require "rails_helper"

RSpec.describe UsersController, type: :request do
  context "as logined user" do
    before {
      @normal_user = create(:user)
      @admin_user = create(:user, admin: true)
    }

    describe "#index" do
      it "returns http success" do
        login(@normal_user)
        get users_path
        expect(response).to be_success
        expect(response).to have_http_status(:success)
      end
    end

    describe "#destroy" do
      context "as normal_user" do
        it "can't delete user" do
          test_user = create(:user)
          login(@normal_user)
          expect{ delete user_path(test_user) }.to raise_error(Pundit::NotAuthorizedError)
        end
      end
      context "get admin_user" do
        it "can delete user" do
          test_user = create(:user)
          login(@admin_user)
          delete user_path(test_user)
          expect(response).to redirect_to(users_path)
        end
      end
    end
  end

  context "as guest user" do
    describe "#index" do
      it "returns http success" do
        get users_path
        expect(response).to have_http_status(:success)
      end
    end
  end
end
