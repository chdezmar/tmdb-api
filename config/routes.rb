Rails.application.routes.draw do
  resources :movies
  resources :sessions
  resources :users

  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'movies#index'
end
