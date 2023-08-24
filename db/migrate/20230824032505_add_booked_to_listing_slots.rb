class AddBookedToListingSlots < ActiveRecord::Migration[7.0]
  def change
    add_column :listing_slots, :booked, :boolean
  end
end
