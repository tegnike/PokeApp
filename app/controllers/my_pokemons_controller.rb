class MyPokemonsController < ApplicationController
  protect_from_forgery

  def index
    @my_pokemon = MyPokemonForm.new
    @my_pokemons = current_user.my_pokemons.all if user_signed_in?
  end

  def create
    @my_pokemon = MyPokemonForm.new(my_pokemon_params)
    if @my_pokemon.save
      flash[:notice] = "登録しました。"
      redirect_to root_path
    else
      @my_pokemons = current_user.my_pokemons.all
      flash[:alert] = "登録に失敗しました。"
      render "index"
    end
  end

  def auto_complete_name
    names = Pokemon.select(:name)
      .where("name like '%" + params[:term] + "%'").order(:number).map(&:name)
    render json: names.to_json
  end

  def auto_complete_ability
    abilities = Pokemon.find_by(name: params[:pokemon_name]).abilities.order(:id).map(&:ability)
    render json: abilities.to_json
  end

  def auto_complete_item
    items = Item.select(:item)
      .where("item like '%" + params[:term] + "%'").order(:id).map(&:item)
    render json: items.to_json
  end

  def auto_complete_move
    moves = Move.select(:move)
      .where("move like '%" + params[:term] + "%'").order(:id).map(&:move)
    render json: moves.to_json
  end

  def auto_complete_role
    roles = MyPokemon.select(:role)
      .where("role like '%" + params[:term] + "%'").order(:id).map(&:role).distinct
    render json: roles.to_json
  end

  def pokemon_list
    send_data render_to_string, filename: "pokemon_list.csv", type: :csv
  end

  private
    def my_pokemon_params
      params.require(:my_pokemon_form).permit(
        :user_id, :name, :ability, :status_up, :status_down, :item,
        :ev_h, :ev_a, :ev_b, :ev_c, :ev_d, :ev_s,
        :iv_h, :iv_a, :iv_b, :iv_c, :iv_d, :iv_s,
        :move_1, :move_2, :move_3, :move_4, :role
      )
    end
end
