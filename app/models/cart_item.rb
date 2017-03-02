class CartItem
  include ActionView::Helpers::NumberHelper

  attr_reader :id, :quantity

  delegate :title, :price, :image, :display_price, to: :donation

  def initialize(id, quantity)
    @id = id
    @quantity = quantity
  end

  def subtotal
    donation.price * quantity
  end

  def display_subtotal
    number_to_currency(subtotal)
  end

  def image_url
    image.url(:thumb)
  end

  def data(order_id)
    {
      order_id: order_id,
      donation_id: @id,
      quantity: @quantity,
      subtotal: subtotal
    }
  end

  private

  def donation
    @donation ||= Donation.find(id)
  end
end
#hound
