require "rails_helper"

feature "User Admin Dashboard exists" do
  scenario "as an Admin I can view Admin Dashboard" do
    admin = create(:user, role: 1)

    visit login_path

    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password
    click_on "Login"

    expect(page).to have_content("Admin Dashboard")
  end

  scenario "as a registered user I cannot access Admin Dashboard" do
    user = create(:user)

    allow_any_instance_of(ApplicationController)
    .to receive(:current_user).and_return(user)

    visit "/admin/dashboard"

    expect(page).to have_content("404")
    expect(page).to_not have_content("Admin Dashboard")
  end

  scenario "an unregistered user gets a 404 error when visiting Admin Dashboard" do
    visit "/admin/dashboard"

    expect(page).to have_content("404")
  end
end
