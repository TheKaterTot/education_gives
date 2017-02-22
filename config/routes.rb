Rails.application.routes.draw do

  root to: "home#index"

  resources :donations, only: [:index, :show]
  resources :cart

  get ":slug" => "categories#show", :as => "category"
end
