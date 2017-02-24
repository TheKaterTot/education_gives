require 'rails_helper'

RSpec.describe OrderDonation, type: :model do
  it {should belong_to(:order)}
  it {should belong_to(:donation)}
end
