Rails.application.routes.draw do
  root 'home#index'
  get '/calf_creek_horizon', to: 'home#show', as: :cch
  get '/calf_creek_info_horizon_info', to: 'home#cch_info', as: :cch_info

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :sites, only: [:index]
    end
  end

  get '/map', to: 'map#show', as: :map

  namespace :admin do
    get '/dashboard', to: 'users#show', as: :dashboard

    resources :artifacts, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :sites
    get '/:point_type', to: 'artifacts#index', as: :points
  end

  resources :artifacts, only: [:show]
  resources :sites, only: [:show, :index]
  get '/:point_type', to: 'artifacts#index', as: :points

  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout
end
