Rails.application.routes.draw do
  devise_for :users
  resources :wikis
  get 'pages/index'
  get 'pages/about'
  root to: 'pages#index'
 end
