class CreateMyPokeItems < ActiveRecord::Migration[5.2]
  def change
    create_table :my_poke_items do |t|
      t.references :my_pokemon, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
    add_index :my_poke_items, [:my_pokemon_id, :item_id], unique: true
  end
end
