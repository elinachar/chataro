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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'devise/sessions#new'
  # root to: "devise/sessions#new"
  # authenticated :user do
  #  root 'rooms#index', as: :authenticated_root
  # end

  # root to: redirect("/users/login")

  # The AcitonCable runs at the same server with the app
  mount ActionCable.server => '/cable'
end
