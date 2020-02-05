class CreatePokeAbilities < ActiveRecord::Migration[5.2]
  def change
    create_table :poke_abilities do |t|
      t.references :pokemon, foreign_key: true
      t.references :ability, foreign_key: true

      t.timestamps
    end
    add_index :poke_abilities, [:pokemon_id, :ability_id], unique: true
  end
end
