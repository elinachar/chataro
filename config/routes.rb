Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

  devise_scope :user do
    authenticated :user do
      root 'rooms#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end


  resources :users

  resources :rooms do
    resources :messages
  end


  # The AcitonCable runs at the same server with the app
  mount ActionCable.server => '/cable'
end
