require "rails_helper"

RSpec.describe MyPokemonsController, type: :request do
  context "as logined user" do
    before {
      @user = create(:user)
    }

    describe "#index" do
      it "returns http success" do
        login(@user)
        get users_path
        expect(response).to be_success
        expect(response).to have_http_status(:success)
      end
    end

    describe "#create" do
      before {
        login(@user)
        create(:pokemon, full_name: "テストポケモン")
        create(:ability, ability: "テスト特性")
        create(:item, item: "テストアイテム")
        (1..4).each do |n|
          create(:move, move: "テストわざ#{n}")
        end
      }
      context "my_pokemon has enought info." do
        it "can increase my_pokemon's count" do
          my_pokemons_count = MyPokemon.count
          my_pokemon_params = attributes_for(
            :my_pokemon,
            user_id: @user.id,
            name: "テストポケモン",
            ability: "テスト特性",
            status_up: "0",
            status_down: "2",
            item: "テストアイテム",
            ev_h: 4, ev_a: 252, ev_b: 0, ev_c: 0, ev_d: 0, ev_s: 252,
            iv_h: "31", iv_a: "31", iv_b: "31", iv_c: "", iv_d: "31", iv_s: "31",
            move_1: "テストわざ1", move_2: "テストわざ2",
            move_3: "テストわざ3", move_4: "テストわざ4",
            role: "テスト役割"
          )
          post my_pokemons_path, params: { my_pokemon_form: my_pokemon_params }
          expect(MyPokemon.count).to eq(my_pokemons_count + 1)
          expect(response).to redirect_to(root_path)
        end
      end
      context "my_pokemon has not enought info." do
        it "can't increase my_pokemon's count" do
          my_pokemons_count = MyPokemon.count
          my_pokemon_params = attributes_for(
            :my_pokemon,
            user_id: @user.id,
            name: "テストポケモン",
            ability: "テスト特性",
            status_up: "0",
            status_down: "2",
            item: nil, # アイテムなし
            ev_h: 4, ev_a: 252, ev_b: 0, ev_c: 0, ev_d: 0, ev_s: 252,
            iv_h: "31", iv_a: "31", iv_b: "31", iv_c: "", iv_d: "31", iv_s: "31",
            move_1: "テストわざ1", move_2: "テストわざ2",
            move_3: "テストわざ3", move_4: "テストわざ4",
            role: "テスト役割"
          )
          post my_pokemons_path, params: { my_pokemon_form: my_pokemon_params }
          expect(MyPokemon.count).to eq(my_pokemons_count)
          expect(response).to have_http_status(:success)
        end
      end
    end

    describe "#destroy" do
      before { login(@user) }
      context "try to delete own my_pokemon" do
        it "can delete" do
          my_pokemon = create(:my_pokemon, user: @user)
          my_pokemons_count = MyPokemon.count
          delete my_pokemons_path, params: { checked_my_pokemons: [ my_pokemon.id ] }
          expect(MyPokemon.count).to eq(my_pokemons_count - 1)
          expect(response).to redirect_to(root_path)
        end
      end
      context "try to delete other_user my_pokemon" do
        it "can't delete " do
          my_pokemon = create(:my_pokemon)
          my_pokemons_count = MyPokemon.count
          delete my_pokemons_path, params: { checked_my_pokemons: [ my_pokemon.id ] }
          expect(MyPokemon.count).to eq(my_pokemons_count)
          expect(response).to redirect_to(root_path)
        end
      end
    end
  end

  context "as guest user" do
    describe "#index" do
      it "returns http success" do
        get users_path
        expect(response).to have_http_status(:success)
      end
    end
  end
end
