Rails.application.routes.draw do
  root 'home#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :sites, only: [:index]
    end
  end

  namespace :admin do
    get '/dashboard', to: 'users#show'
    resources :artifacts, only: [:new, :create, :show]
    resources :sites, only: [:new, :create, :show]
  end

  resources :artifacts, only: [:index, :show]
  get '/map', to: 'map#show', as: :map_path

  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout
end
