Rails.application.routes.draw do
  root 'home#index'

  resources :images, only: [:index, :show, :new, :create]

  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout
end
