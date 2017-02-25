require "rails_helper"

feature "Visitor cannot view the order page" do
  scenario "and they receive an error" do
    order = create(:order)
    visit order_path(order)

    expect(page).to_not have_css(".nav-bar")
    expect(page).to_not have_css("#order-info")
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
