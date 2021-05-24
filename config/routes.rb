Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post "/login", to: "auth#create"
      get "/profile", to: "users#profile"
      resources :customers, only: %i(index show create update destroy)
      resources :task_logs
      resources :tasks
      resources :projects
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
