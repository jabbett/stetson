Rails.application.routes.draw do
  # Authentication
  get 'auth/oauth2/callback' => 'sessions#callback'
  get 'auth/failure' => 'sessions#failure'
  get 'logout' => 'sessions#logout'

  resources :pages
  resources :stetson_configs, only: [:edit, :update]
  resources :comments, only: [:create, :destroy] do
    member do
      put :resolve
      put :unresolve
    end
  end

  root 'public#index'
end
