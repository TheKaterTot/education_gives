require "rails_helper"

feature "User can view a past order" do
  scenario "by going to the order index page" do
    user = create(:user)
    orders = create_list(:order_with_donations, 2, user: user)
    other_user = create(:user)
    other_orders = create_list(:order_with_donations, 2, user: other_user)
    allow_any_instance_of(ApplicationController)
    .to receive(:current_user).and_return(user)

    visit orders_path

    expect(find("#id-#{orders[0].id}")).to have_content(orders[0].id)
    expect(find("#id-#{orders[1].id}")).to have_content(orders[1].id)
    expect(page).to_not have_css("#id-#{other_orders[0].id}")
    expect(page).to_not have_css("#id-#{other_orders[1].id}")

    within("#order-#{orders[0].id}") do
      expect(page).to have_content(orders[0].id)
      expect(page).to have_content(orders[0].display_create_date)
      expect(page).to have_content(orders[0].total)
      expect(page).to have_content(orders[0].display_status)
      expect(page).to have_link("View Details", href: order_path(orders[0]))
    end
    within("#order-#{orders[1].id}") do
      expect(page).to have_content(orders[1].id)
      expect(page).to have_content(orders[1].display_create_date)
      expect(page).to have_content(orders[1].total)
      expect(page).to have_content(orders[1].display_status)
      expect(page).to have_link("View Details", href: order_path(orders[1]))
    end
  end
end
