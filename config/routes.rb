Rails.application.routes.draw do
  root to: 'users#index'
  resources :users, only: [:new, :create, :show]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  
end
