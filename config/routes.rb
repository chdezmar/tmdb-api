Rails.application.routes.draw do
  resources :movies do
    resources :ratings, except: [:index, :show]
  end
  resources :sessions
  resources :users

  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'movies#index'
end
