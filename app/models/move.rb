class Move < ApplicationRecord
  self.inheritance_column = :_type_disabled

  has_many :my_poke_moves, dependent: :destroy
  has_many :my_pokemons, through: :my_poke_moves
  validates :move, presence: true
  validates :type, presence: true

  enum type: {
    normal: 0, fire: 1, water: 2, electric: 3,
    grass: 4, ice: 5, fighting: 6, poison: 7, ground: 8,
    flying: 9, psychic: 10, bug: 11, rock: 12, ghost: 13,
    dragon: 14, dark: 15, steel: 16, fairy: 17
  }, _prefix: true
end
