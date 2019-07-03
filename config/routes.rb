Rails.application.routes.draw do
  # Authentication
  get 'auth/oauth2/callback' => 'sessions#callback'
  get 'auth/failure' => 'sessions#failure'
  get 'logout' => 'sessions#logout'

  resources :stetson_configs, only: [:edit, :update]
  resources :pages do
    resources :versions, only: [:index, :show]
    resources :attachments, only: [:create, :destroy]
  end
  resources :comments, only: [:create, :destroy] do
    member do
      put :resolve
      put :unresolve
    end
  end

  root 'public#index'
end
