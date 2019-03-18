Rails.application.routes.draw do
  devise_for :users
  devise_for :contractors
  root to: 'home#index'

  resources :categories, only: [:index, :edit, :update, :new, :create, :show] do
    resources :contractors, only: [:index]
  end

  resources :contractors, only: [:show, :edit, :update] do
    resources :estimates, only: [:new, :create]
  end

  resources :users, only: [:show]
  
end
