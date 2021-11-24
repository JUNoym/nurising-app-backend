Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      delete '/todos/destroy_all', to: 'todos#destroy_all'
      resources :todos
      post '/excretion/push_time', to: 'excretion#push_time'
      delete '/excretion/destroy_all', to: 'excretion#destroy_all'
      resources :excretion
    end
  end
end
