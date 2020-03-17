class PokeAbility < ApplicationRecord
  belongs_to :pokemon
  belongs_to :ability
  validates :pokemon_id, presence: true
  validates :ability_id, presence: true
  validate :has_less_three_abilities?

  private
    def has_less_three_abilities?
      if pokemon.abilities.count > 3
        errors.add(:base, "特性は3つまでしか登録できません")
      end
    end
end
