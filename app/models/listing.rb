class Listing < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :listing_slots, dependent: :destroy
  has_many :bookings, through: :listing_slots
  #image lisiting upload
  has_many_attached :photos
end
