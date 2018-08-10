Rails.application.routes.draw do
  devise_for :users
  resources :users

  resources :rooms do
    resources :messages
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'rooms#index'

  # The AcitonCable runs at the same server with the app
  mount ActionCable.server => '/cable'
end
