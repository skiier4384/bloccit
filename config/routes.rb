Rails.application.routes.draw do
   root 'welcome#index'
   get 'about', to: 'welcome#about'
   
   namespace :api do
     namespace :v1 do
       resources :users, only: [:index, :show, :create, :update]
       resources :topics, except: [:edit, :new]
     end
   end
  
   resources :labels, only: [:show]

   resources :topics do
      resources :posts, except: [:index]
   end
   
   resources :topics, only: [] do
    resources :comments, only: [:create, :destroy]
  end

   resources :users, only: [:new, :create, :show]
   resources :sessions, only: [:new, :create, :destroy]
   
   resources :posts, only: [] do
     resources :comments, only: [:create, :destroy]
     resources :favorites, only: [:create, :destroy]
   
     post '/up-vote' => 'votes#up_vote', as: :up_vote
     post '/down-vote' => 'votes#down_vote', as: :down_vote
   end
end
