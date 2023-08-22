class Listing < ApplicationRecord
  belongs_to :user
  has_many :reviews, :listing_slots
  has_one :user
  has_many :bookings, through: :listing_slots
end
