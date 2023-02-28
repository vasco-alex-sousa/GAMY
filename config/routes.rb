Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:create, :destroy]
    resources :reviews, only: [:index, :create]
  end

  resources :users, only: [:show]

  get '/profile', to: 'users#profile', as: 'user_profile'
end
