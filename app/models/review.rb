class Review < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  has_one :user, :listing
end
