require 'rails_helper'

RSpec.describe "Admin cannot modify users" do
  scenario "admin cannot modify users" do
    admin = create(:user, role: 1)
    user2 = create(:user)

    visit login_path

    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password
    click_on "Login"

    expect(current_path).to eq admin_dashboard_path

    visit dashboard_path

    expect(current_path).to eq dashboard_path

    click_on "Update Account"

    fill_in "user[first_name]", with: "Samantha"
    fill_in "user[password]", with: admin.password
    click_on "Update"

    expect(current_path).to eq dashboard_path
    expect(page).to have_content("Welcome, Samantha!")

    #verify admin cannot modify other user profile
  end
end
