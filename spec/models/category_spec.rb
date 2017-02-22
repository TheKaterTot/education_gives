require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:donations) }
  it { should validate_uniqueness_of(:name) }

  it "is invalid without a name" do
    FactoryGirl.build(:category, name: nil).should_not be_valid
  end
end
