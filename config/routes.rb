Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts, only: [:index]

  namespace :admin do
    resources :posts, only: [:new, :create, :edit, :destroy]
  end
end
