class Item < ApplicationRecord
  has_many :my_poke_items, dependent: :destroy
  has_many :my_pokemons, through: :my_poke_items
  validates :item, presence: true
end
