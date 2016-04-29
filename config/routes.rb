Rails.application.routes.draw do

  resources :posts

  root 'welcome#index'

  get 'about', to: 'welcome#about'

end
