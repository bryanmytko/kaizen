Rails.application.routes.draw do
  root "sessions#index"

  post "login", to: "sessions#login", as: "login"
  get "logout", to: "sessions#logout", as: "logout"

  resources :activities do
    resources :entries, only: :create
  end

  resources :about, only: :index
end
