Rails.application.routes.draw do
  root "activities#index"

  post "login", to: "sessions#login", as: "create_login"
  get "login",  to: "sessions#index"
  get "logout", to: "sessions#logout", as: "logout"

  resources :activities do
    resources :entries, only: :create
  end

  resources :about, only: :index
end
