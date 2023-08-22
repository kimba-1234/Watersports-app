class ListingSlot < ApplicationRecord
  belongs_to :listing
  has_one :booking
end
