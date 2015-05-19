Rails.application.routes.draw do
  devise_for :users
  resources :wikis
  resources :charges, only: [:new, :create]
  get 'charges/downgrade'
  get 'pages/index'
  get 'pages/about'
  root to: 'pages#index'
 end
