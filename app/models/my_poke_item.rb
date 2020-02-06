class MyPokeItem < ApplicationRecord
  belongs_to :my_pokemon
  belongs_to :item
  validates :my_pokemon_id, presence: true
  validates :item_id, presence: true
  validate :items_number

  private
    def items_number
      if self.my_pokemon.item
        errors.add(:items, "は1つしか設定できません")
      end
    end
end
