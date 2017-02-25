require 'rails_helper'

RSpec.describe "Admin redirected to admin dashboard after login" do
  xscenario "admin goes to admin dashboard after login" do
    user = create(:user)
    #make the user an admin
    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_on "Login"

    expect(current_path).to eq admin_dashboard_path
  end
end
