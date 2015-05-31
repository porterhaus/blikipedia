Rails.application.routes.draw do
  # Users
  devise_for :users
  resources :users

  # Wikis
  resources :wikis

  # Charges
  get 'charges/downgrade'
  resources :charges, only: [:new, :create]

  # Search
  get "search" => 'search#index', as: :search

  # Pages
  get 'pages/index'
  get 'pages/about'

  root to: 'pages#index'
 end
