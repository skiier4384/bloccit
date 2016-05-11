Rails.application.routes.draw do
  root 'welcome#index'
  get 'about', to: 'welcome#about'
  
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  resources :topics do
    resources :posts, except: [:index]
  end
  
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end
  
end
