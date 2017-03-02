class OrderDonation < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  belongs_to :order
  belongs_to :donation

  def display_subtotal
    number_to_currency(subtotal)
  end
end
#hound
