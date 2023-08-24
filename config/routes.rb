Rails.application.routes.draw do
  devise_for :users
  root to: "listings#index"

  resources :listings do
    resources :listing_slots, only: %i[new create] do
      resources :bookings, only: %i[new create]
    end
  end

  resources :listing_slots, only: [:index]

  resources :bookings, only: %i[index show destroy]
end
