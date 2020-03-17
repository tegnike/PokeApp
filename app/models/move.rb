class Move < ApplicationRecord
  self.inheritance_column = :_type_disabled

  has_many :my_poke_moves, dependent: :destroy
  has_many :my_pokemons, through: :my_poke_moves
  validates :move, presence: true
  validates :type, presence: true
end
