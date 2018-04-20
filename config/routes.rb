Rails.application.routes.draw do
  root 'posts#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  resources :posts
  resources :users, only: [:new, :create]	  
end
