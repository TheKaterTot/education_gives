Rails.application.routes.draw do

  root to: "home#index"

  resources :donations, only: [:index, :show]
  resources :cart, only: [:index, :create]

  get ":slug" => "categories#show", :as => "category"
end
