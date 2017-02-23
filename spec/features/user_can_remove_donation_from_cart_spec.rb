require "rails_helper"

feature "user can remove item from cart" do
  scenario "they visit their cart" do
    donation = create(:donation)
    visit donations_path
    click_on "Add to Cart"

    visit cart_index_path

    click_on "Remove"

    expect(current_path).to eq(cart_index_path)
    expect(page).to have_content(
      "Successfully removed #{donation.title} from your cart."
      )
    expect(page).to have_link(donation.title, href: donation_path(donation))
    expect(page).to_not have_css("#donation-#{donation.id}")
  end
end
