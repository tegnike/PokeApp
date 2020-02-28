Rails.application.routes.draw do
  root "my_pokemons#index"
  devise_for :users

  resources :users, only: [:index, :show]
  resources :my_pokemons, only: [:index, :create] do
    collection do
      get :auto_complete_name
      post :auto_complete_ability
      get :auto_complete_item
      get :auto_complete_move
      get :pokemon_list
    end
  end
end
