Rails.application.routes.draw do
  root "staticpage#index"

  get "/new_session", to: "sessions#new"
  post "/new_session", to: "sessions#create"
  delete "/delete_session", to: "sessions#destroy"
  resources :users , except: [:index, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :clubs, only: [:index, :show]
  resources :players, only: [:index, :show]
  resources :scores
  resources :category_match_rates
  resources :rates, only: [:index, :show]
  resources :category_news, only: [:index, :show]
  namespace :admin do
    resources :users, :players, :rates, :clubs, :category_news
  end
  get "admin", to: "admin/welcome#home"
  delete "/delete_admin", to: "admin/users#destroy"
end
