require "rails_helper"

feature "User can view retired item" do
  scenario "they visit the item show page" do
    donation = create(:donation, active: false)

    visit donation_path(donation)

    expect(page).to_not have_link("Add to Cart")
    expect(page).to have_content("Donation Retired")
  end
end

