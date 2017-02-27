class OrderDonation < ApplicationRecord
  belongs_to :order
  belongs_to :donation

  def subtotal
    # quantity * donation.price
  end

  def display_subtotal
    # number_to_currency(subtotal)
  end
end
