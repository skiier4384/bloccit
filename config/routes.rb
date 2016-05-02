Rails.application.routes.draw do
  
  resources :posts
  resources :questions

  root 'welcome#index'

  get 'about', to: 'welcome#about'

end
