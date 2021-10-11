Rails.application.routes.draw do
  devise_for :property_tenants, path: 'tenants'
  devise_for :property_owners, path: 'owners'
  root to: 'home#index'
  get 'my_profile', to: 'property_prenants#my_profile'

  # authenticated :property_owner do
  #   get 'properties#new', as: :new_property_path
  # end
  # get 'properties#new': redirect('/owners/sign_up')

  resources :properties, only: [:index, :show, :new, :create] do
    get 'my_properties', on: :collection
    resources :property_reservations, only: [:create, :show], shallow: true
    post 'accept', on: :member
  end
  resources :property_types, only: [:show, :new, :create]
  resources :property_locations, only: [:show, :new, :create]
end
