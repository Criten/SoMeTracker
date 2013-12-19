SoMeTracker::Application.routes.draw do
  root to: "home#index"
  
  #Custom API for devise
  resources :users, only: [:create]
  resources :sessions, only: [:create, :destroy]
  get 'sessions/current', to: 'sessions#current'

  devise_for :users
end
