Rails.application.routes.draw do
  resources :zones 
  resources :neighborhoods
  resources :concetps 
  resources :plans 
  resources :rates
  resources :cities
  resources :people
  resources :signal_tvs
  resources :companies
  resources :users
  get 'zones/:campo/:valor', to: 'zones#show'
  get 'neighborhoods/:campo/:valor', to: 'neighborhoods#show'
  get 'rates/:campo/:valor', to: 'rates#show'
  get 'users/:usuario', to: 'users#index'
  get 'users/:campo/:valor', to: 'users#show'
  get 'users/cambioclave/:id/:clave', to: 'users#change_password'
  get 'people/:campo/:valor', to: 'people#show'
  get 'signal_tvs/:campo/:valor', to: 'signal_tvs#show'
  get 'users/login/:user/:clave', to: 'users#login'
  get 'companies/:campo/:valor', to: 'companies#show'
end
