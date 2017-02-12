Rails.application.routes.draw do
  devise_for :users
  post 'user_token' => 'user_token#create'
  resources :todos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/current-user', to: "current_user#show"
  resources :users
  # post '/login', to: "sessions#create"
end
