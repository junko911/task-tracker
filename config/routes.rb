Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post "/login", to: "auth#create"
      get "/profile", to: "users#profile"

      resources :customers do
        resources :projects, only: %i(index create)
      end

      resources :projects, only: %i(show update destroy) do
        resources :tasks, only: %i(index create)
      end

      resources :tasks, only: %i(show update destroy) do
        resources :task_logs, only: %i(index create)
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
