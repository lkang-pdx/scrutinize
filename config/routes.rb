Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:new, :create, :show] do
    resources :registered_applications
  end

  resources :registered_applications, only: [] do
    resources :events, only: [:create, :destroy]
  end

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'
end
