Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :donations

  resources :carts

  root to: "home#index"

  resources :donations, only: [:index, :show]

  get ":slug" => "categories#show", :as => "category"

end
