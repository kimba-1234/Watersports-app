class Booking < ApplicationRecord
  belongs_to :listing_slot
  belongs_to :user
end
