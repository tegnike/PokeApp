class MyPokeMove < ApplicationRecord
  belongs_to :my_pokemon
  belongs_to :move
  validates :move_id, presence: true
  validate :has_less_four_moves?

  private
    def has_less_four_moves?
      if my_pokemon.moves.count > 4
        errors.add(:base, "技は4つまでしか登録できません")
      end
    end
end
