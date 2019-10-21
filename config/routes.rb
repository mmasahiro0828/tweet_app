Rails.application.routes.draw do
  
  root to: "tweets#index"
  resources :tweets
  
  resources :users
  
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#login"
  delete '/logout', to: "sessions#destroy"
  
  post "/like/:id/create", to: "likes#create"
  post "/like/:id/delete", to: "likes#destroy"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
