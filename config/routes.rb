Rails.application.routes.draw do
  get 'admin/dashboard'
  root 'pages#home'
  resources :posts
  resources :adopts
  resources :animals
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
  resources :users, only: [:destroy]    
  get '/dashboard' => 'admin#dashboard', as: "dashboard"
  get '/history' => 'pages#history', as: 'history'
  get '/requests/:id' => 'pages#requests', as: 'requests'
  get '/admin/register' => 'admin#new', as: 'register'
  get '/user/new' => 'users#new', as: 'new_user' # Route to the user creation form
  post '/user/create' => 'users#create', as: 'create_user' # Route to create the user
  get '/cat' => 'pages#cat', as: 'cat'
  get '/dog' => 'pages#dog', as: 'dog'
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
