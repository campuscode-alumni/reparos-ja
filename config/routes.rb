Rails.application.routes.draw do
  devise_for :users
  devise_for :contractors
  root to: 'home#index'

  resources :categories, only: [:index, :edit, :update] do
    resources :contractors, only: [:index]
  end

  resources :contractors, only: [:show] do
    resources :estimates, only: [:new, :create]
  end
  
end
