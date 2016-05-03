Rails.application.routes.draw do
  
   resources :topics do
 # #34
   resources :posts, except: [:index]
   
   end

  get 'about', to: 'welcome#about'
  
  root 'welcome#index'
end
