require 'rails_helper'

RSpec.describe "Admin can see all orders" do
  scenario "admin can see all orders" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    ordered = create(:order, status: "ordered")
    paid = create(:order, status: "paid")
    cancelled = create(:order, status: "cancelled")
    completed = create(:order, status: "completed")

    visit admin_dashboard_path

    expect(page).to have_content("Order List")

    within("#order-#{ordered.id}") do
      expect(find("#id-#{ordered.id}")).to have_content(ordered.id)
      expect(page).to have_content("Ordered")
      expect(page).to have_link("View Order", href: order_path(ordered))
      expect(page).to have_button("Mark as paid")
      expect(page).to have_button("Mark as cancelled")
    end

    within("#order-#{paid.id}") do
      expect(find("#id-#{paid.id}")).to have_content(paid.id)
      expect(page).to have_content("Paid")
      expect(page).to have_link("View Order", href: order_path(paid))
      expect(page).to have_button("Mark as completed")
      expect(page).to have_button("Mark as cancelled")
    end

    within("#order-#{completed.id}") do
      expect(find("#id-#{completed.id}")).to have_content(completed.id)
      expect(page).to have_content("Completed")
      expect(page).to have_link("View Order", href: order_path(completed))
      expect(page).to_not have_button("Mark as paid")
      expect(page).to_not have_button("Mark as completed")
      expect(page).to_not have_button("Mark as cancelled")
    end

    within("#order-#{cancelled.id}") do
      expect(find("#id-#{cancelled.id}")).to have_content(cancelled.id)
      expect(page).to have_content("Cancelled")
      expect(page).to have_link("View Order", href: order_path(cancelled))
      expect(page).to_not have_button("Mark as paid")
      expect(page).to_not have_button("Mark as completed")
      expect(page).to_not have_button("Mark as cancelled")
    end
  end
end
