Rails.application.routes.draw do
  # Authentication
  get 'auth/oauth2/callback' => 'sessions#callback'
  get 'auth/failure' => 'sessions#failure'
  get 'logout' => 'sessions#logout'
  get 'change_password' => 'sessions#change_password'

  get 'secure' => 'secure#show'
  get 'user' => 'users#show'

  resources :pages
  resources :stetson_configs, only: [:edit, :update]

  root 'pages#show', id: StetsonConfig.first.home_page_id
end
