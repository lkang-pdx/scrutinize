Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:new, :create, :show] do
    resources :registered_applications
  end

  resources :registered_applications, only: [] do
    resources :events, only: [:create, :destroy]
  end

  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'
end
