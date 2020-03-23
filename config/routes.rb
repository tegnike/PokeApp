Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "my_pokemons#index"
  devise_for :users

  resources :users, only: [:index, :destroy]
  resources :my_pokemons, only: [:index, :create] do
    collection do
      delete :destroy
      get :auto_complete_name
      post :auto_complete_ability
      get :auto_complete_item
      get :auto_complete_move
      get :pokemon_list
    end
  end
end
