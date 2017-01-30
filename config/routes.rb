Rails.application.routes.draw do
  resources :todos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/current-user', to: "current_user#show"
  resources :users
  # post '/login', to: "sessions#create"
  mount Knock::Engine => "/knock"
end
