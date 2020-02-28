class CreateMyPokeAbilities < ActiveRecord::Migration[5.2]
  def change
    create_table :my_poke_abilities do |t|
      t.references :my_pokemon, foreign_key: true
      t.references :ability, foreign_key: true

      t.timestamps
    end
    add_index :my_poke_abilities, [:my_pokemon_id, :ability_id], unique: true
  end
end
