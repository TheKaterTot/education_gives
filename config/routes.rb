Rails.application.routes.draw do
  root to: "home#index"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/dashboard", to: "users#show"

  resources :donations, only: [:index, :show]
  resources :cart#, only: [:index, :create, :update]

  resources :users, only: [:new, :create, :edit, :update]

  resources :orders

  namespace :admin do
    get "/dashboard", to: "users#show"
  end

  get ":slug" => "categories#show", :as => "category"
end
