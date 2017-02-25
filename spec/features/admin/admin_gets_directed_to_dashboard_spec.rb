require 'rails_helper'

feature "Admin logs in and see admin dashboard" do
  scenario "Admin gets redirected to dashboard" do
    admin = User.create(first_name: "Admin", last_name: "Admin", email: "admin@email.com", username: "admin", password: "password", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit '/admin/dashboard'

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("Admin Dashboard")
    expect(page).to have_content("Logout")
  end
end
