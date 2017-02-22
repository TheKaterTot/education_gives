require 'rails_helper'

RSpec.describe Donation, type: :model do
  it "can calculate the total number of items it holds" do
    cart = Cart.new({"1" => 2, "2" => 3})

    expect(cart.total_count).to eq(5)
  end
end
