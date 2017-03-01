require 'rails_helper'

feature "Authenticated user security" do
  scenario "an authenticated user can't see another user's dashboard" do
    user = create(:user, first_name: "Jane")
    user2 = create(:user, first_name: "John")

    allow_any_instance_of(ApplicationController)
    .to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_content("Welcome, Jane!")
    expect(page).to_not have_content("Welcome, John!")

    visit admin_dashboard_path

    expect(page).to have_content("404")
  end
end
