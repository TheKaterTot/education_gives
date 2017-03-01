require 'rails_helper'

RSpec.describe OrderDonation, type: :model do
  it {should belong_to(:order)}
  it {should belong_to(:donation)}

  it "has a subtotal" do
    order_donation = create(:order_donation)
    
    expect(order_donation.subtotal).to eq(order_donation.quantity * order_donation.donation.price)
  end
end
