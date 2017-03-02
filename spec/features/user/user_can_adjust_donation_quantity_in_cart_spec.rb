require "rails_helper"

RSpec.describe "User can adjust donation quantity in cart" do
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
end
