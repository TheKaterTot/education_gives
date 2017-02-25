require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_secure_password }
  it { should have_many(:orders) }
  it { should define_enum_for(:role).with([:default, :admin]) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_uniqueness_of(:username) }

  it "is invalid without a first name" do
    user = FactoryGirl.build(:user, first_name: nil)
    expect(user).to_not be_valid
  end

  it "is invalid without a last name" do
    user = FactoryGirl.build(:user, last_name: nil)
    expect(user).to_not be_valid
  end

  it "is invalid without an email" do
    user = FactoryGirl.build(:user, email: nil)
    expect(user).to_not be_valid
  end

  it "is invalid without a password" do
    user = FactoryGirl.build(:user, password: nil)
    expect(user).to_not be_valid
  end

  it "is invalid without an username" do
    user = FactoryGirl.build(:user, username: nil)
    expect(user).to_not be_valid
  end
end
