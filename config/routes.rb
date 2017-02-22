Rails.application.routes.draw do

  root to: "home#index"

  resources :donations, only: [:index, :show]
  
  get ":slug" => "categories#show", :as => "category"
end
