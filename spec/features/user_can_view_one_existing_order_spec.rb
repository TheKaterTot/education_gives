require 'rails_helper'

RSpec.describe "User sees all donations in an order" do
  scenario "User sees all donations in an order" do
    user = create(:user)
    orders = create_list(:order_with_donations, 2, user: user)
    donations = orders.first.donations
    order_details = orders.first.details
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit order_path(orders.first)
    binding.pry

    within("#donation-#{donation[0].id}") do
      expect(page).to have_css("img[src*='#{donation[0].image_path}']")
      expect(page).to have_content(donation[0].title)
      # expect(page).to have_content(donation[0].description)
      expect(page).to have_content(donation[0].price)
      expect(page).to have_content(donation[0].quantity)
      expect(page).to have_content(order_details[0].quantity)
      # expect(page).to have_content(order_details[0].subtotal)
    end
    within("#donation-#{donation[1].id}") do
      expect(page).to have_css("img[src*='#{donation[1].image_path}']")
      expect(page).to have_content(donation[1].title)
      # expect(page).to have_content(donation[1].description)
      expect(page).to have_content(donation[1].price)
      expect(page).to have_content(donation[1].quantity)
      expect(page).to have_content(order_details[1].quantity)
      # expect(page).to have_content(order_details[1].subtotal)
    end
    within("#donation-#{donation[2].id}") do
      expect(page).to have_css("img[src*='#{donation[2].image_path}']")
      expect(page).to have_content(donation[2].title)
      # expect(page).to have_content(donation[2].description)
      expect(page).to have_content(donation[2].price)
      expect(page).to have_content(donation[2].quantity)
      expect(page).to have_content(order_details[2].quantity)
      # expect(page).to have_content(order_details[2].subtotal)
    end

    within("#total") do
      # expect(page).to have_content(order.total)
    end

  end
end
