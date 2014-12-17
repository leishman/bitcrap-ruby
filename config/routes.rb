Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'
  get '/wtf', to: 'home#wtf'
  post '/aslfkjw232', to: 'callback#callback', as: 'callback'
  get '/return/:ref_id', to: 'orders#return'
  get '/cancel', to: 'orders#cancel'

  resources :shipping_addresses, only: [:create]
  resources :orders, only: [:create, :show], param: 'ref_id'
end
