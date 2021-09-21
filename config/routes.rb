Rails.application.routes.draw do
  root to: 'home#index'
  resources :properties
  resolve('Properties') { [:properties] }
  # resource :properties
  # get '/properties/:id', to: 'properties#show', as: 'properties'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
