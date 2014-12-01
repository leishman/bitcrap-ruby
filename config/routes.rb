Rails.application.routes.draw do

  scope :api do
    resources :orders
  end

  root 'home#index'
end
