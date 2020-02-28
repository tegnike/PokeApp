class Pokemon < ApplicationRecord
  has_many :my_pokemons, dependent: :destroy
  has_many :poke_abilities, dependent: :destroy
  has_many :abilities, through: :poke_abilities

  validates :number, presence: true
  validates :name, presence: true
  validates :type1, presence: true
  validates :bs_h, presence: true
  validates :bs_a, presence: true
  validates :bs_b, presence: true
  validates :bs_c, presence: true
  validates :bs_d, presence: true
  validates :bs_s, presence: true

  enum type1: {
    normal: 0, fire: 1, water: 2, electric: 3,
    grass: 4, ice: 5, fighting: 6, poison: 7, ground: 8,
    flying: 9, psychic: 10, bug: 11, rock: 12, ghost: 13,
    dragon: 14, dark: 15, steel: 16, fairy: 17
  }, _prefix: true
  enum type2: {
    normal: 0, fire: 1, water: 2, electric: 3,
    grass: 4, ice: 5, fighting: 6, poison: 7, ground: 8,
    flying: 9, psychic: 10, bug: 11, rock: 12, ghost: 13,
    dragon: 14, dark: 15, steel: 16, fairy: 17
  }, _prefix: true
end
