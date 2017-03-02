require "rails_helper"

RSpec.describe "Visitor cannot see checkout in cart" do
  scenario "visitor cannot see checkout in cart" do
    donation = create(:donation)
    visit donation_path(donation)

    click_on "Add to Cart"

    click_on "Cart: 1"

    expect(current_path).to eq cart_index_path
    expect(page).to have_content("#{donation.title}")
    expect(page).to have_selector(:link_or_button, "Login or Register to Checkout")

    click_on "Login or Register to Checkout"
    click_on "Create Account"

    expect(current_path).to eq new_user_path

    fill_in("First name", with: "Jane")
    fill_in("Last name", with: "Doe")
    fill_in("Email", with: "janedoe@email.com")
    fill_in("Username", with: "janedoe")
    fill_in("Password", with: "password")

    click_on "Create User"

    expect(current_path).to eq dashboard_path

    click_on "Cart: 1"

    expect(current_path).to eq cart_index_path
    expect(page).to have_content("#{donation.title}")

    click_on "Logout"

    expect(current_path).to eq login_path

    expect(page).to have_selector(:link_or_button, "Login")
    expect(page).to_not have_selector(:link_or_button, "Logout")
  end

end
