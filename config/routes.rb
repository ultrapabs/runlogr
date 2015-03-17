Rails.application.routes.draw do

  root to: 'static_pages#root'

  resources :users, only: [:create]
  resource :sessions, only: [:new, :create, :destroy]

  namespace :api, defaults: {format: :json} do
    resources :blogs, except: [:new]
    resources :logs, except: [:new]
    resources :shoes, only: [:index, :create, :destroy, :edit]
    resources :users, only: [:index, :show, :update]
    resources :follows, only: [:create, :destroy]

  end

end
