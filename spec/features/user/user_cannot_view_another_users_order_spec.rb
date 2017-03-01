require "rails_helper"

feature "User cannot view another user's order" do
  scenario "and they receive an error" do
    user = create(:user)
    order = create(:order_with_donations, user: user)
    other_user = create(:user)
    other_order = create(:order_with_donations, user: other_user)
    allow_any_instance_of(ApplicationController)
    .to receive(:current_user).and_return(user)

    visit order_path(other_order)

    expect(page).to_not have_css(".nav-bar")
    expect(page).to_not have_css("#order-info")
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
