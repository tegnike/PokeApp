class MyPokeMove < ApplicationRecord
  belongs_to :my_pokemon
  belongs_to :move
  validates :move_id, presence: true
  validate :moves_number

  private
    def moves_number
      if self.my_pokemon.moves.size >= 4
        errors.add(:moves, "は4つ以下しか設定できません")
      end
    end
end
