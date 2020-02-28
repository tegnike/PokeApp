class CreateMyPokeMoves < ActiveRecord::Migration[5.2]
  def change
    create_table :my_poke_moves do |t|
      t.references :my_pokemon, foreign_key: true
      t.references :move, foreign_key: true

      t.timestamps
    end
    add_index :my_poke_moves, [:my_pokemon_id, :move_id], unique: true
  end
end
