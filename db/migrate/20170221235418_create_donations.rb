class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.string :title
      t.text :description
      t.float :price
      t.string :image_path

      t.timestamps
    end
  end
end
