require 'rails_helper'

RSpec.describe Donation, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:image_path) }
  it { should belong_to(:category) }

  it "is invalid without attributes" do
    FactoryGirl.build(:donation, title: nil).should_not be_valid
    FactoryGirl.build(:donation, description: nil).should_not be_valid
    FactoryGirl.build(:donation, price: nil).should_not be_valid
    FactoryGirl.build(:donation, image_path: nil).should_not be_valid
    FactoryGirl.build(:donation, category: nil).should_not be_valid
  end
end
