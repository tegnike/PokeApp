class MyPokeItem < ApplicationRecord
  belongs_to :my_pokemon
  belongs_to :item
  validates :my_pokemon_id, presence: true
  validates :item_id, presence: true
end
