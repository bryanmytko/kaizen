Rails.application.routes.draw do
  root "activities#index"

  post "login", to: "sessions#login", as: "create_login"
  get "login",  to: "sessions#index"
  get "logout", to: "sessions#logout", as: "logout"

  get "signup", to: "users#new", as: "signup"

  resources :activities do
    resources :entries, only: :create
  end

  resources :users, only: :create
  resources :about, only: :index
end
