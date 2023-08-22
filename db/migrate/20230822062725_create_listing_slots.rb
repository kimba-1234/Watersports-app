class CreateListingSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :listing_slots do |t|
      t.references :listing, null: false, foreign_key: true
      t.date :start_time
      t.date :end_time

      t.timestamps
    end
  end
end
