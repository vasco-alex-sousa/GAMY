Rails.application.routes.draw do
  get 'home/index'
  get 'users/index'
  get 'reviews/create'
  get 'bookings/index'
  get 'bookings/create'
  get 'bookings/destroy'
  get 'categories/index'
  get 'products/index'
  get 'products/show'
  get 'products/new'
  get 'products/create'
  get 'products/destroy'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
