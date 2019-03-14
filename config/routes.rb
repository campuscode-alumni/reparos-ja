Rails.application.routes.draw do
  root to: 'categories#index'

  resources :categories, only: [:index] do
    resources :contractors, only: [:index]
  end
end
