require 'rails_helper'

feature "Admin logs in and see admin dashboard" do
  scenario "Admin gets redirected to dashboard" do
    admin = User.create(first_name: "Admin", last_name: "Admin", email: "admin@email.com", username: "admin", password: "password", role: 1)

    visit login_path

    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password
    click_on "Login"
    
    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("Admin Dashboard")
    expect(page).to have_content("Logout")
  end
end
