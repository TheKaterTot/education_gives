class Cart
  include ActionView::Helpers::NumberHelper

  attr_reader :contents

  def initialize(initial_contents = {})
    @contents = initial_contents
  end

  def total_count
    contents.values.sum
  end

  def add_donation(donation_id)
    contents[donation_id.to_s] ||= 0
    contents[donation_id.to_s] += 1
  end

  def update_quantity(donation_id, quantity)
    if quantity.to_i < 1
      false
    else
      contents[donation_id] = quantity.to_i
    end
  end

  def remove_item(donation_id)
    contents.delete(donation_id.to_s)
  end

  def count_of(donation_id)
    contents[donation_id.to_s]
  end

  def cart_items
    @cart_items ||= contents.keys.map do |id|
      CartItem.new(id, contents[id])
    end
  end

  def total
    cart_items.reduce(0) do |sum, item|
      sum += item.subtotal
    end
  end

  def display_total
    number_to_currency(total)
  end

  def purchase(user)
    Order.transaction do
      order = Order.create!(user: user)
      cart_items.each do |cart_item|
        OrderDonation.create!(cart_item.data(order.id))
      end
    end
    true
  rescue
    false
  end
end
