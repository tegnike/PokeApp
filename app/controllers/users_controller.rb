class UsersController < ApplicationController
  before_action :set_user, only: :destroy
  before_action :pundit_auth

  def index
    @users = User.all.order(created_at: :desc).page(params[:page])
  end

  def destroy
    @user.destroy
    redirect_to users_url
    flash[:notice] = "#{@user.name}を削除しました。"
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def pundit_auth
      authorize User.new
    end
end
