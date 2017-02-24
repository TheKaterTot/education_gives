require 'rails_helper'

RSpec.describe "Admin cannot modify users" do
  scenario "admin cannot modify users" do
    user = create(:user)
    user2 = create(:user)
    #make the user an admin
    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_on "Login"

    expect(current_path).to eq admin_dashboard_path
    #click_on "My Profile"

    expect(current_path).to eq dashboard_path
end
