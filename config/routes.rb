Rails.application.routes.draw do

  root to: "home#index"

  resources :donations, only: [:index, :show]

end
