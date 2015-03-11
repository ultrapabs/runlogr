Rails.application.routes.draw do

  root to: 'static_pages#root'

  resources :users, only: [:create]
  resource :sessions, only: [:new, :create, :destroy]

  namespace :api, defaults: {format: :json} do
    resources :blogs
    resources :logs
  end

end
