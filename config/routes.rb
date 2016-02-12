Rails.application.routes.draw do
  root "activities#index"

  resources :activities do
    resources :entries, only: :create
  end

  resources :about, only: :index
end
