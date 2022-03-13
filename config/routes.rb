Rails.application.routes.draw do
  mount_devise_token_auth_for 'DeviseUser', at: 'auth'
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for "DeviseUser", at: "auth"
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

      put 'register_staffs/update_status', to: 'register_staffs#update_status'
      resources :register_staffs
      resources :auth_users
      resources :sessions
      resources :get_users

    end
  end
end
