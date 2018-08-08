Rails.application.routes.draw do
  devise_for :users
  resources :messages
  resources :rooms
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'rooms#index'

  # Run ActionCable in same server as the app
  mount ActionCable.server => '/cable'
end