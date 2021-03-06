Rails.application.routes.draw do
  root to: "home#index"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/dashboard", to: "users#show"
  get "/update_account", to: "users#edit"

  resources :donations, only: [:index, :show]
  resources :cart, except: [:new, :show]

  resources :users, only: [:new, :create, :edit, :update]

  resources :orders, only: [:index, :create, :show]

  namespace :admin do
    get "/dashboard", to: "users#show"
    resources :orders, only: [:update, :destroy, :show]
    resources :donations, only: [:index, :new, :create, :show, :edit, :update]
  end

  get ":slug" => "categories#show", :as => "category"
end
