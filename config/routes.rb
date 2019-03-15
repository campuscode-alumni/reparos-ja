Rails.application.routes.draw do
  devise_for :users
  devise_for :contractors
  root to: 'home#index'

  resources :categories, only: [:index] do
    resources :contractors, only: [:index]
  end
  
end
