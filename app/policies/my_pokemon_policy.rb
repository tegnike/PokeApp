class MyPokemonPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.name?
  end

  def destroy?
    user.name?
  end

  def pokemon_list?
    user.admin?
  end
end
