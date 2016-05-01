Rails.application.routes.draw do

  resources :advertisements
  resources :posts

  root 'welcome#index'

  get 'about', to: 'welcome#about'

end
