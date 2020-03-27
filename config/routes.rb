Rails.application.routes.draw do
  resources :pictures, only: [:index, :new, :show, :create]
  resources :users, only: [:show]
  resources :tags, only: [:index, :show, :new, :create]
  resources :comments, only: [:index, :show, :new, :create]
  
  
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/pictures' => 'pictures#show'

  get '/tag' => 'tags#show'
  
  get '/login' => 'sessions#new' 
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
 
end
