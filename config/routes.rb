Rails.application.routes.draw do
  root 'posts#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :posts do
    resources :comments, only: [:create]
  end
  resources :users, only: [:new, :create]

  namespace :api, defaults: {format: "json"} do
    namespace :v1 do
      resources :posts
    end  
  end	  
end
