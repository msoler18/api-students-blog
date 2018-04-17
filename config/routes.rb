Rails.application.routes.draw do
  root 'posts#index'
  resources :users
  resources :posts
  resources :users, only: [:new, :create]	  
end
