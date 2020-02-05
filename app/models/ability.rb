class Ability < ApplicationRecord
  has_many :poke_abilities, dependent: :destroy
  has_many :pokemons, through: :poke_abilities

  validates :ability, presence: true
end
