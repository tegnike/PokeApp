class CreateMyPokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :my_pokemons do |t|
      t.references :user, foreign_key: true
      t.references :pokemon, foreign_key: true
      t.integer :nature
      t.integer :ev_h
      t.integer :ev_a
      t.integer :ev_b
      t.integer :ev_c
      t.integer :ev_d
      t.integer :ev_s
      t.integer :iv_h
      t.integer :iv_a
      t.integer :iv_b
      t.integer :iv_c
      t.integer :iv_d
      t.integer :iv_s
      t.string :role

      t.timestamps
    end
    add_index :my_pokemons, [:user_id, :pokemon_id]
  end
end
