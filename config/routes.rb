Rails.application.routes.draw do

  root 'home#index'
  post '/aslfkjw232', to: 'callback#callback', as: 'callback'

  resources :shipping_addresses, only: [:create]
  resources :orders, only: [:create, :show]
end
