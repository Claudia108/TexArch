Rails.application.routes.draw do
  root 'home#index'
  get '/calf_creek_horizon', to: 'home#show', as: :cch

  resources :info, only: [:index]
  get '/info/preforms', to: 'info#show', as: :preforms

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :sites, only: [:index]
    end
  end

  get '/map', to: 'map#show', as: :map

  namespace :admin do
    get '/dashboard', to: 'users#show', as: :dashboard
    resources :users, only: [:index]

    resources :artifacts, only: [:new, :create, :edit, :update, :destroy]
    resources :sites, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :artifacts, only: [:show]
  get '/:point_type', to: 'artifacts#index', as: :points
  resources :sites, only: [:show, :index]

  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout
end
