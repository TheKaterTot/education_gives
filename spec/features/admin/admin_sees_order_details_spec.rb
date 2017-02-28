require 'rails_helper'

RSpec.describe "User sees order details" do
  scenario "user can see order details" do
    user = create(:user)
    order_donation = create(:order_donation)
    byebug

    visit order_path(order_donation.order_id)

    expect(page).to have_content(order_donation.order.created_at)
    # expect(page).to have_content(order_donation.order.user_id.username) #doesn't work
    # expect(page).to have_content(order_donation.order.user_id.email) #doesn't work
    # expect(page).to have_content(order_donation.order_id.title) #doesn't work
    # expect(page).to have_content(order_donation.donation_id.price) #doesn't work
    expect(page).to have_content(order_donation.subtotal)
    # expect(page).to have_content(order_donation.order_id.total) #doesn't work
    # expect(page).to have_content(order_donation.order_id.status) #doesn't work
  end
end
