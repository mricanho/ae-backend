Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create], path: 'register'
      resources :users, only: [:index], path: 'users'
      resources :authentication, only: [:create], path: 'login'
      resource :appointments, only: [:create, :destroy, :show]
      resources :appointments, only: [:index], path: 'admin/appointments'
      resources :lecture_groups, only: [:index], path: 'types'
      resources :lectures, only: [:index]
    end
  end
end