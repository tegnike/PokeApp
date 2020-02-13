class MyPokeAbility < ApplicationRecord
  belongs_to :my_pokemon
  belongs_to :ability
  validates :my_pokemon_id, presence: true
  validates :ability_id, presence: true
end
