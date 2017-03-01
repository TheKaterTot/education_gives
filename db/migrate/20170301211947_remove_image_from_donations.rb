class RemoveImageFromDonations < ActiveRecord::Migration[5.0]
  def change
    remove_column :donations, :image_path
  end
end
