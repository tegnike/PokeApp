class PokeAbility < ApplicationRecord
  belongs_to :pokemon
  belongs_to :ability
  validates :pokemon_id, presence: true
  validates :ability_id, presence: true
  validate :abilities_number

  private
    def abilities_number
      if self.pokemon.abilities.size >= 3
        errors.add(:abilities, "は3以下で設定してください")
      end
    end
end
