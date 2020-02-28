class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.integer :number
      t.string :name
      t.integer :type1
      t.integer :type2
      t.string :form
      t.integer :bs_h
      t.integer :bs_a
      t.integer :bs_b
      t.integer :bs_c
      t.integer :bs_d
      t.integer :bs_s

      t.timestamps
    end
  end
end
