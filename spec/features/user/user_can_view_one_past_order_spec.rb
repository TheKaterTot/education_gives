require 'rails_helper'

RSpec.describe "User can view one past order" do
  scenario "User sees all donations in an order" do
    user = create(:user)
    order_paid = create(:order_with_donations, user: user, status: "paid")
    order_completed = create(:order_with_donations, user: user, status: "completed")
    donations = order_paid.donations
    order_details = order_paid.details
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit orders_path

    within("#order-#{order_completed.id}") do
      click_link "View Details"
    end

    expect(current_path).to eq(order_path(order_completed))
    within("#order-info") do
      expect(page).to have_content("Completed")
      expect(page).to have_content(order_completed.total)
      expect(page).to have_content(order_completed.display_create_date)
      expect(page).to have_content(order_completed.display_update_date)
    end

    visit order_path(order_paid)
    within("#order-info") do
      expect(page).to have_content("Paid")
      expect(page).to have_content(order_completed.total)
      expect(page).to have_content(order_completed.display_create_date)
      expect(page).to have_content(order_completed.display_update_date)
    end
    within("#donation-#{donations[0].id}") do
      expect(page).to have_link(donations[0].title, href: donation_path(donations[0]))
      expect(page).to have_content(order_details[0].quantity)
      expect(page).to have_content(order_details[0].subtotal)
    end
    within("#donation-#{donations[1].id}") do
      expect(page).to have_link(donations[1].title, href: donation_path(donations[1]))
      expect(page).to have_content(order_details[1].quantity)
      expect(page).to have_content(order_details[1].subtotal)
    end
    within("#donation-#{donations[2].id}") do
      expect(page).to have_link(donations[2].title, href: donation_path(donations[2]))
      expect(page).to have_content(order_details[2].quantity)
      expect(page).to have_content(order_details[2].subtotal)
    end
  end
end
