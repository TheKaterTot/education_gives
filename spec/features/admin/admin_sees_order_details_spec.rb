require 'rails_helper'

RSpec.describe "User sees order details" do
  scenario "user can see order details" do
    user = create(:user)
    order = create(:order, user_id: user.id)
    donation = create(:donation)
    order_donation = create(:order_donation, order_id: order.id, donation_id: donation.id)

    visit admin_order_path(order_donation.order_id)

    expect(page).to have_content(order.created_at)
    expect(page).to have_content(user.full_name)
    expect(page).to have_content(user.email)
    expect(page).to have_content(order_donation.quantity)
    expect(page).to have_content(donation.title)
    expect(page).to have_content(donation.price)
    expect(page).to have_content(order_donation.subtotal)
    expect(page).to have_content(order.total)
    expect(page).to have_content(order.status)
  end
end
