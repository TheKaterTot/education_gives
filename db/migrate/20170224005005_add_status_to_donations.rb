class AddStatusToDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :active, :boolean, default: true
  end
end
