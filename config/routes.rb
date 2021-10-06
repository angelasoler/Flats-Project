Rails.application.routes.draw do
  devise_for :property_tenants, path: 'tenants'
  devise_for :property_owners, path: 'owners'
  root to: 'home#index'
  resources :properties, only: [:show, :new, :create] do
    get 'my_properties', on: :collection
  end
  resources :property_types, only: [:show, :new, :create]
  resources :property_locations, only: [:show, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
