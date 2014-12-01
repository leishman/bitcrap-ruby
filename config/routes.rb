Rails.application.routes.draw do

  resources :shipping_addresses, only: [:create]
  resources :orders, only: [:create, :show]

  root 'home#index'
end
