require 'rails_helper'

feature "Authenticated user security" do
  scenario "an authenticated user can't see another user's dashboard" do
    user = User.create(first_name: "Jane", last_name: "Doe", email: "janedoe@email.com", username: "janedoe", password: "password", role: 0)
    user2 = User.create(first_name: "John", last_name: "Doe", email: "johndoe@email.com", username: "johndoe", password: "password", role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_content("Welcome, Jane!")
    expect(page).to_not have_content("Welcome, John!")

    visit admin_dashboard_path
    
    expect(page).to have_content("404")
  end
end
