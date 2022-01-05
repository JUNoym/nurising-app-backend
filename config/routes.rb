Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      delete '/users/destroy_all', to: 'users#destroy_all'
      resources :users do
        member do
          get "care_actions", to: 'user_care_actions#fetch_care_actions_by_user'
        end
      end

      delete '/vital_users/destroy_all', to: 'vital_users#destroy_all'
      resources :vital_users
      delete '/vital_contents/destroy_all', to: 'vital_contents#destroy_all'
      resources :vital_contents
      
      
      
      delete '/user_care_actions/destroy_all', to: 'user_care_actions#destroy_all'
      resources :user_care_actions
      resources :care_actions

      delete '/todos/destroy_all', to: 'todos#destroy_all'
      resources :todos
      resources :excretion

      get 'archives/search', to: 'archives#search'
      resources :archives

      resources :registrations
      post '/registrations', to: 'registrations#signup'
      post '/login', to: 'sessions#login'
      # delete '/logout', to: 'sessions#logout'
      # get '/logged_in', to: 'sessions#logged_in?'

    end
  end
end
