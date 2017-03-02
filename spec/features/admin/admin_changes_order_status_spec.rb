require "rails_helper"

feature "admin can change order status" do
  scenario "they change an order from ordered to completed" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    order = create(:order, status: "ordered")

    visit admin_dashboard_path
    click_on "Mark as paid"

    within("#order-#{order.id}") do
      expect(page).to have_css("input[value='Mark as completed']")
    end

    click_on "Mark as completed"

    within("#order-#{order.id}") do
      expect(page).to_not have_css("input[type=submit]")
    end
  end

  scenario "they cancel an order" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    order = create(:order, status: "ordered")

    visit admin_dashboard_path

    click_on "Mark as cancelled"

    within("#order-#{order.id}") do
      expect(page).to have_content "Cancelled"
    end
  end

  scenario "they cancel a paid order" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    order = create(:order, status: "paid")

    visit admin_dashboard_path

    click_on "Mark as cancelled"

    within("#order-#{order.id}") do
      expect(page).to have_content "Cancelled"
    end
  end
end
