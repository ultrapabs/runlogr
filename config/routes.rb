Rails.application.routes.draw do

  root 'sessions#new'

  resources :users, only: [:index, :create]
  resource :sessions, only: [:new, :create, :destroy]
end
