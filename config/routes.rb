Rails.application.routes.draw do
  
   resources :topics do
      resources :posts, except: [:index]
   end
   
   resources :users, only: [:new, :create]
   resources :sessions, only: [:new, :create, :destroy]
   
   resources :posts, only: [] do
   resources :comments, only: [:create, :destroy]
   end

   get 'about', to: 'welcome#about'
   
   root 'welcome#index'
end
