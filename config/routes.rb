Rails.application.routes.draw do
  resources :sessions
  resources :users

  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'users#new'
end
