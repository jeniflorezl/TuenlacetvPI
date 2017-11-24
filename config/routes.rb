Rails.application.routes.draw do
  resources :zones 
  resources :neighborhoods
  resources :concetps 
  resources :plans 
  resources :rates
  resources :concetps
  resources :people
  resources :signal_tvs
  resources :companies
  get 'zones/:nombre', to: 'zones#show'
  get 'neighborhoods/:zone_id', to: 'neighborhoods#show'
  get 'neighborhoods/:nombre', to: 'neighborhoods#show'
end
