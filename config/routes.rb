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
  resources :users
  get 'zones/nombre/:nombre', to: 'zones#show'
  get 'neighborhoods/zona/:zone_id', to: 'neighborhoods#show'
  get 'neighborhoods/nombre/:nombre', to: 'neighborhoods#show'
  get 'rates/zona/:zone_id', to: 'rates#show'
  get 'rates/concepto/:concept_id', to: 'rates#show'
  get 'rates/plan/:plan_id', to: 'rates#show'
  get 'rates/valor/:valor', to: 'rates#show'
  get 'users/login/:login', to: 'users#show'
  get 'users/nombre/:nombre', to: 'users#show'
  get 'users/id/:id/clave/:clave', to: 'users#change_password'
end
