require "rails_helper"

feature "user can click add to cart" do
  scenario "from donations index" do
    donation = create(:donation)

    visit donations_path

    click_on "Add to Cart"

    expect(page).to have_content("You now have 1 #{donation.title}.")
  end
end
