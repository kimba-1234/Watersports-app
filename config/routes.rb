Rails.application.routes.draw do
  devise_for :users
  root to: "listings#index"

  resources :listings do
    resources :listing_slots, only: [:new, :create] do
      resources :bookings, only: [:new, :create]
    end
  end

  resources :bookings, only: [:index, :show, :destroy]
end
