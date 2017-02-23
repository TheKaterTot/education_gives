require "rails_helper"

describe Cart do
  it "should delete an item" do
    donation = create(:donation)
    cart = Cart.new
    cart.add_donation(donation.id)
    cart.remove_item(donation.id)

    expect(cart.contents.keys).to_not include(donation.id.to_s)
  end
end
