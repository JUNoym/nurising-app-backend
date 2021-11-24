Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :user_care_actions
      resources :care_actions
      delete '/todos/destroy_all', to: 'todos#destroy_all'
      resources :todos
      resources :excretion
    end
  end
end
