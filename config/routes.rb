Rails.application.routes.draw do
  root "staticpage#index"

  get "/new_session", to: "sessions#new"
  post "/new_session", to: "sessions#create"
  delete "/delete_session", to: "sessions#destroy"
  resources :users , only: [:new, :show, :create, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :clubs, only: [:new, :create, :edit, :update, :show, :index]
  resources :players, only: [:new, :create, :edit, :update, :show, :index]
end
