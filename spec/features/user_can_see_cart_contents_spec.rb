require 'rails_helper'

RSpec.describe "User sees all content of cart" do
  scenario "user can see all content of cart" do
    donation = create(:donation)

    visit donation_path(donation)
    click_on "Add to Cart"

    click_on "Cart: 1"

    expect(current_path).to eq cart_index_path
    expect(page).to have_css("img[src*='#{donation.image_path}']")
    expect(page).to have_content(donation.title)
    expect(page).to have_content(donation.price)
    # expect(page).to have_content(donation.description)
  end
end
