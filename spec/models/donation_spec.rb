require 'rails_helper'

RSpec.describe Donation, type: :model do
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:description)}
  it {should validate_presence_of(:price)}
  it {should validate_presence_of(:image_path)}
end
