class ChangeStartTimeToBeTimeInListingSlots < ActiveRecord::Migration[7.0]
  def change
    change_column :listing_slots, :start_time, :datetime
    change_column :listing_slots, :end_time, :datetime
  end
end
