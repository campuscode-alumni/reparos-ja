Rails.application.routes.draw do
  devise_for :users
  devise_for :contractors
  root to: 'home#index'


  resources :categories do
    resources :contractors, only: [:index]
  end

  resources :contractors, only: [:show, :edit, :update] do
    resources :estimates, only: [:new, :create]
  end

  resources :service_orders, only: [:show] do
    resources :user_reviews, only: [:new, :create]
  end

  resources :users, only: [:show]

  resources :estimates, only: [:index, :show, :edit, :update] do
    member do
      post :approve
    end
  end
  resources :service_orders, only: [:show] do
    resources :contractor_reviews
  end

end
