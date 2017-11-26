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
  get 'people/documento/:documento', to: 'people#show'
  get 'people/nombre1/:nombre1', to: 'people#show'
  get 'people/nombre2/:nombre2', to: 'people#show'
  get 'people/apellido1/:apellido1', to: 'people#show'
  get 'people/apellido2/:apellido2', to: 'people#show'
  get 'people/zona/:zone_id', to: 'people#show'
  get 'people/barrio/:neighborhood_id', to: 'people#show'
  get 'people/telefono1/:telefono1', to: 'people#show'
  get 'people/direccion/:direccion', to: 'people#show'
  get 'people/funcion/:function_id', to: 'people#show'
  get 'signal_tvs/:campo/:valor', to: 'signal_tvs#show'

end
