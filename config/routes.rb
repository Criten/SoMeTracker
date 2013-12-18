SoMeTracker::Application.routes.draw do
  root to: "home#index"
  
  #Custom API for devise
  resources :users, only: [:create]
  resources :sessions, only: [:create, :destroy]

  devise_for :users
end
