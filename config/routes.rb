Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/show'
  
  get 'devise/registrations'
  devise_for :users
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "posts#index"
  # Defines the root path route ("/")
  # root "articles#index"
end