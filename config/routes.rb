Rails.application.routes.draw do
  root "staticpage#index"
  resources :users
end
