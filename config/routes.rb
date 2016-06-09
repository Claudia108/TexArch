Rails.application.routes.draw do
  root 'home#index'

  namespace :admin do
    get '/dashboard', to: 'users#show'
    resources :artifacts, only: [:new, :create]
  end

  resources :artifacts, only: [:index, :show]

  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout
end
