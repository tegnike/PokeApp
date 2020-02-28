class MyPokeMove < ApplicationRecord
  belongs_to :my_pokemon
  belongs_to :move
  validates :move_id, presence: true
end
