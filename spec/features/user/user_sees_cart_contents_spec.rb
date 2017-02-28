require 'rails_helper'

RSpec.describe "User sees all content of cart" do
  scenario "user can see all content of cart" do
    donation = create(:donation)

    visit donation_path(donation)
    click_on "Add to Cart"

    click_on "Cart: 1"

    expect(current_path).to eq cart_index_path

    within("#donation-#{donation.id}") do
      expect(page).to have_css("img[src*='#{donation.image.url}']")
      expect(page).to have_content(donation.title)
      expect(page).to have_content(donation.price)
      expect(find_field("cart[quantity]").value).to eq "1"
      expect(page).to have_content("50")
      # expect(page).to have_content(donation.description)
    end

    within("#total") do
      expect(page).to have_content("50")
    end

  end
end
