require 'rails_helper'

RSpec.describe "User adjusts quantity of donation in cart" do
  scenario "user can adjust quantity of donation in cart" do
    donation = create(:donation)

    visit donation_path(donation)
    click_on "Add to Cart"

    visit cart_index_path
    within("#donation-#{donation.id}") do
      fill_in "cart[quantity]", with: 10
      click_on "Update"
    end

    within("#donation-#{donation.id}") do
      expect(page).to have_content("500")
    end

  end

  scenario "User adjusts multiple donations in the cart" do
    donation1 = create(:donation)
    donation2 = create(:donation)

    visit donation_path(donation1)
    click_on "Add to Cart"

    visit donation_path(donation2)
    click_on "Add to Cart"

    visit cart_index_path
    within("#donation-#{donation1.id}") do
      fill_in "cart[quantity]", with: 10
      click_on "Update"
    end

    within("#donation-#{donation1.id}") do
      expect(page).to have_content("500")
    end

    within("#donation-#{donation2.id}") do
      fill_in "cart[quantity]", with: 5
      click_on "Update"
    end

    within("#donation-#{donation2.id}") do
      expect(page).to have_content("250")
    end
  end
end
