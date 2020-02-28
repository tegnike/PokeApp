class AddColumnsToPokemon < ActiveRecord::Migration[5.2]
  def up
    add_column :pokemons, :form_name, :string
    add_column :pokemons, :full_name, :string
  end

  def down
    remove_column :pokemons, :form_name
    remove_column :pokemons, :full_name
  end
end
