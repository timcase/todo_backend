Rails.application.routes.draw do
  resources :departments do
    resources :todos
  end
  resources :todos
  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/current-user', to: "current_user#show"
  resources :users do
    resources :todos
    collection do
      get :search
    end
  end
  # post '/login', to: "sessions#create"
end
