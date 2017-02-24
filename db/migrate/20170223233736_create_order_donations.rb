class CreateOrderDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :order_donations do |t|
      t.references :order, foreign_key: true
      t.references :donation, foreign_key: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
