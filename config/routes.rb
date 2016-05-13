Rails.application.routes.draw do
   root 'welcome#index'
   get 'about', to: 'welcome#about'
  
   resources :labels, only: [:show]

   resources :topics do
      resources :posts, except: [:index]
   end
   
   resources :users, only: [:new, :create]
   resources :sessions, only: [:new, :create, :destroy]
   
   resources :posts, only: [] do
   resources :comments, only: [:create, :destroy]
   end
end
