require 'rails_helper'

RSpec.describe Donation, type: :model do
  it { should belong_to(:category) }
  it { should have_many(:order_details) }
  it { should have_many(:orders) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
  it { should validate_uniqueness_of(:title) }

  it "is invalid without attributes" do
    donation_title = FactoryGirl.build(:donation, title: nil)
    expect(donation_title).to_not be_valid

    donation_description = FactoryGirl.build(:donation, description: nil)
    expect(donation_description).to_not be_valid

    donation_price = FactoryGirl.build(:donation, price: nil)
    expect(donation_price).to_not be_valid

    donation_category = FactoryGirl.build(:donation, category: nil)
    expect(donation_category).to_not be_valid
  end

  it "returns only active donations" do
    donation_1 = create(:donation)
    create(:donation, active: false)

    expect(Donation.active.to_a).to eq([donation_1])
  end

  it "can give subtotal of donation" do
    donation_1 = create(:donation)

    expect(donation_1.subtotal(3)).to eq(1500.0)
  end

  it "confirms that donation is active by default" do
    donation = create(:donation)

    expect(donation.active).to eq(true)
  end
end
