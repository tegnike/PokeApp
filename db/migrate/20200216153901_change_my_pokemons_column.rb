class ChangeMyPokemonsColumn < ActiveRecord::Migration[5.2]
  def up
    remove_column :my_pokemons, :nature
    add_column :my_pokemons, :status_up, :integer
    add_column :my_pokemons, :status_down, :integer
  end

  def down
    add_column :my_pokemons, :nature, :integer
    remove_column :my_pokemons, :status_up
    remove_column :my_pokemons, :status_down
  end
end
