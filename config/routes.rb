Rails.application.routes.draw do
  resources :zones do
    resources :neighborhoods
  end
  resources :companies
end
