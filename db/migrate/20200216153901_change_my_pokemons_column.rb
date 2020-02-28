class ChangeMyPokemonsColumn < ActiveRecord::Migration[5.2]
  def up
    remove_column :my_pokemons, :nature
    add_column :my_pokemons, :status_up, :integer
    add_column :my_pokemons, :status_down, :integer
    add_column :my_pokemons, :av_h, :integer
    add_column :my_pokemons, :av_a, :integer
    add_column :my_pokemons, :av_b, :integer
    add_column :my_pokemons, :av_c, :integer
    add_column :my_pokemons, :av_d, :integer
    add_column :my_pokemons, :av_s, :integer
  end

  def down
    add_column :my_pokemons, :nature, :integer
    remove_column :my_pokemons, :status_up
    remove_column :my_pokemons, :status_down
    remove_column :my_pokemons, :av_h
    remove_column :my_pokemons, :av_a
    remove_column :my_pokemons, :av_b
    remove_column :my_pokemons, :av_c
    remove_column :my_pokemons, :av_d
    remove_column :my_pokemons, :av_s
  end
end
