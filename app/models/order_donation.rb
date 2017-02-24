class OrderDonation < ApplicationRecord
  belongs_to :order
  belongs_to :donation

  def subtotal
    quantity * donation.price
  end
end
