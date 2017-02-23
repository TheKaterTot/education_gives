class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def total_count
    contents.values.sum
  end

  def add_donation(donation_id)
    contents[donation_id.to_s] ||= 0
    contents[donation_id.to_s] += 1
  end

  def update_quantity(donation_id, quantity)
    contents[donation_id] = quantity.to_i
  end

  def count_of(donation_id)
    contents[donation_id.to_s]
  end

  def display_cart
    @contents.reduce({}) do |donations, (id, quantity)|
      donations.merge!({Donation.find(id) => quantity})
    end
  end

  def total
    display_cart.reduce(0) do |sum, (donation, quantity)|
      sum += donation.subtotal(quantity)
    end
  end
end
