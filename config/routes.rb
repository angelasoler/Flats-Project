Rails.application.routes.draw do
  devise_for :property_owners
  root to: 'home#index'
  resources :properties, only: [:show, :new, :create]
  resources :property_types, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
