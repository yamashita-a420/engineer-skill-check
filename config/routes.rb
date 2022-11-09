Rails.application.routes.draw do
  resources :articles, only: %i(index new create edit update destroy)
  root 'dashboard#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :employees, only: %i(index new create edit update destroy) do
    resource :profile, only: %i(show edit update)
  end
end
