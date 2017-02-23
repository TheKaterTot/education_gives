require 'rails_helper'

RSpec.describe Cart, type: :model do
  it "can calculate the total number of items it holds" do
    cart = Cart.new({"1" => 2, "2" => 3})

    expect(cart.total_count).to eq(5)
  end

  it "can add a donation to its contents" do
    cart = Cart.new({"1" => 1})

    cart.add_donation(1)
    cart.add_donation(2)

    expect(cart.contents).to eq({"1" => 2, "2" => 1})
  end

  it "can report on how many of a particular donation it has" do
    cart = Cart.new({ "1" => 3, "2" => 1 })

    expect(cart.count_of(1)).to eq(3)
  end

  it "should delete an item" do
    donation = create(:donation)
    cart = Cart.new
    cart.add_donation(donation.id)
    cart.remove_item(donation.id)

    expect(cart.contents.keys).to_not include(donation.id.to_s)
  end
end
