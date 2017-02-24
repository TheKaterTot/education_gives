require "rails_helper"

feature "User can view a past order" do
  scenario "by going to the order index page" do
    user = create(:user)
    orders = create_list(:order_with_donations, 2, user: user)
    other_user = create(:user)
    other_orders = create_list(:order_with_donations, 2, user: user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit orders_path

    expect(page).to have_content(orders[0].id)
    expect(page).to have_content(orders[1].id)
    expect(page).to have_content(orders[2].id)
    expect(page).to_not have_content(other_orders[0].id)
    expect(page).to_not have_content(other_orders[1].id)
    expect(page).to_not have_content(other_orders[2].id)

    within("#order-#{orders[0].id}") do
      expect(page).to have_content(orders[0].id)
      expect(page).to have_content(orders[0].display_create_at)
      expect(page).to have_content(orders[0].total)
      expect(page).to have_content(orders[0].status)
      expect(page).to have_link("View Details", href: dashboard_path(orders[0]))
    end
    within("#order-#{orders[1].id}") do
      expect(page).to have_content(orders[1].id)
      expect(page).to have_content(orders[1].display_create_at)
      expect(page).to have_content(orders[1].total)
      expect(page).to have_content(orders[1].status)
      expect(page).to have_link("View Details", href: dashboard_path(orders[1]))
    end
    within("#order-#{orders[2].id}") do
      expect(page).to have_content(orders[1].id)
      expect(page).to have_content(orders[1].display_create_at)
      expect(page).to have_content(orders[1].total)
      expect(page).to have_content(orders[1].status)
      expect(page).to have_link("View Details", href: dashboard_path(orders[2]))
    end
  end
end