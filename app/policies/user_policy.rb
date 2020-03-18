class UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def destroy?
    user.admin?
  end
end
