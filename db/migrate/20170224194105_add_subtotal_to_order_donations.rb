class AddSubtotalToOrderDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :order_donations, :subtotal, :integer
  end
end
