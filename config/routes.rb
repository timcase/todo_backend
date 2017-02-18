Rails.application.routes.draw do
  post 'user_token' => 'tokens#create'
  resources :todos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/current-user', to: "current_user#show"
  resources :users do
    collection do
      get :search
    end
  end
  # post '/login', to: "sessions#create"
end
