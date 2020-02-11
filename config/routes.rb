Rails.application.routes.draw do
  root "my_pokemons#index"
  devise_for :users

  resources :users, only: [:index, :show]
  resources :my_pokemons, only: [:index, :create] do
  end
end
