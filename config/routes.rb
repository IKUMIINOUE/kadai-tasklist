Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'toppages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "tasks#index"
  
  get "login", to: "sessions#new"
  post "login", to: "seesions#create"
  delete "logout", to: "sessions#destroy"
  
  get "signup" , to: "user#new"
  resources :tasks
  resources :users, only:[:index, :show, :new, :create]
  
end
