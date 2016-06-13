Rails.application.routes.draw do
  root 'home#index'
  get '/calf_creek_horizon', to: 'home#show', as: :cch
  get '/calf_creek_info_horizon_info', to: 'home#cch_info', as: :cch_info

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :sites, only: [:index]
    end
  end

  namespace :admin do
    get '/dashboard', to: 'users#show', as: :dashboard
    resources :artifacts
    resources :sites
  end

  resources :artifacts, only: [:show]
  get '/arifacts/andice', to: 'artifacts#andice', as: :andice
  get '/arifacts/bell', to: 'artifacts#bell', as: :bell
  get '/arifacts/calf_creek', to: 'artifacts#calf_creek', as: :calf_creek

  resources :sites, only: [:show, :index]

  get '/map', to: 'map#show', as: :map_path

  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout
end
