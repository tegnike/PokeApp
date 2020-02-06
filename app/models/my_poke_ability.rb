class MyPokeAbility < ApplicationRecord
  belongs_to :my_pokemon
  belongs_to :ability
  validates :my_pokemon_id, presence: true
  validates :ability_id, presence: true
  validate :abilities_number

  private
    def abilities_number
      if self.my_pokemon.ability
        errors.add(:abilities, "は1つしか設定できません")
      end
    end
end
