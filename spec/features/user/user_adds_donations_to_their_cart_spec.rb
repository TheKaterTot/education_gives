require "rails_helper"

RSpec.feature "When a user adds donations to their cart", type: :feature do
  before(:each) do
    @donation = create(:donation)
  end

  scenario "a message is displayed" do
    visit donation_path(@donation)
    click_button "Add to Cart"

    expect(current_path).to eq donations_path
    expect(page).to have_content("You now have 1 #{@donation.title}.")
  end

  scenario "the message correctly increments for multiple items" do
    visit donation_path(@donation)
    click_button "Add to Cart"

    expect(page).to have_content("You now have 1 #{@donation.title}.")
    click_on "#{@donation.title}" 

    expect(current_path).to eq donation_path(@donation)
    click_button "Add to Cart"

    expect(page).to have_content("You now have 2 #{@donation.title}s.")
  end

  scenario "the total number of donations in the cart increments" do
    visit donation_path(@donation)

    expect(page).to have_content("Cart: 0")

    click_button "Add to Cart"

    expect(page).to have_content("Cart: 1")
  end
end
