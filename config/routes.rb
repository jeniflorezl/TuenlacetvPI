Rails.application.routes.draw do
  resources :zones do
    resources :neighborhoods
    resources :concetps do
      resources :rates
    end
  end
  resources :concetps
  resources :companies
end
