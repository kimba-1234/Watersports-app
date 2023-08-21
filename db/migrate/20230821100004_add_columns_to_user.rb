class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :user_type, :string
    add_column :users, :vendor_name, :string
    add_column :users, :vendor_description, :string
  end
end
