require 'rails_helper'

RSpec.describe "User places order" do
  scenario "user can place an order" do
    create(:donation)
    user = create(:user)

    visit donations_path
    click_on "Add to Cart"
    click_on "Cart: 1"
    expect(current_path).to eq cart_index_path

    click_on "Login or Register to Checkout"

    expect(current_path).to eq login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_on "Login"

    expect(current_path).to eq dashboard_path
    click_on "Cart: 1"

    expect(current_path).to eq cart_index_path
    click_on "Checkout"

    expect(current_path).to eq orders_path
    expect(page).to have_content("Order was successfully placed")
    expect(page).to have_content("Your Order")
  end
end
