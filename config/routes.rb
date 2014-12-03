Rails.application.routes.draw do

  root 'home#index'
  post '/aslfkjw232', to: 'callback#callback', as: 'callback'
  get '/return/:ref_id', to: 'orders#return'
  get '/cancel/:ref_id', to: 'orders#cancel'

  resources :shipping_addresses, only: [:create]
  resources :orders, only: [:create, :show]
end
