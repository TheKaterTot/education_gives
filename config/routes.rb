Rails.application.routes.draw do

  root to: "home#index"
  get "/login", to: "sessions#new"

  resources :donations, only: [:index, :show]
  resources :carts

  resources :users, only: [:new]

  get ":slug" => "categories#show", :as => "category"
end
