Rails.application.routes.draw do
  root 'home#index'

  get "up" => "rails/health#show", as: :rails_health_check

  # Authentication routes
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Profile routes
  resources :profiles, only: [:new, :create, :show] # Adding resourceful routes for profiles
  get '/profile', to: 'profiles#profile', as: :profile_settings
end
