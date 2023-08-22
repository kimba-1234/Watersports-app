class Listing < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :listing_slots
  has_many :bookings, through: :listing_slots
end
