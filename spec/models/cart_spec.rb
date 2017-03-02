require "rails_helper"

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

  it "can update quantity for an item" do
    cart = Cart.new({"1" => 1})

    cart.add_donation(1)

    expect(cart.count_of(1)).to eq(2)
  end

  describe "#total" do
    it "returns the total of the item prices" do
      donation1 = create(:donation, price: 5)
      donation2 = create(:donation, price: 3)

      cart = Cart.new(donation1.id.to_s => 1, donation2.id.to_s => 1)

      expect(cart.total).to eq(8)
    end
  end

  describe "#cart_items" do
    it "returns an array of cart items" do
      cart = Cart.new("1" => 5)

      expect(cart.cart_items.count).to eq(1)
      expect(cart.cart_items.first.class).to eq(CartItem)
    end
  end

  describe "#purchase" do
    it "returns true" do
      donation = create(:donation, price: 5)
      cart = Cart.new(donation.id.to_s => 1)
      user = create(:user)

      expect(cart.purchase(user)).to be true
      expect(user.orders.count).to eq(1)
    end
  end
end
#hound
