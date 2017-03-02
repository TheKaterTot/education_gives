require "rails_helper"

RSpec.feature "Visitor can create an account" do
  scenario "as a visitor I can visit the create an account page" do
    visit "/"

    click_on "Login"
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
    expect(page).to have_link("Create Account")
  end

  scenario "as a visitor I can create an account" do
    visit "/login"
    click_on "Create Account"

    fill_in("First name", with: "Jane")
    fill_in("Last name", with: "Doe")
    fill_in("Email", with: "janedoe@email.com")
    fill_in("Username", with: "janedoe")
    fill_in("Password", with: "password")

    click_on "Create User"

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Logged in as Jane")
    expect(page).to have_content("Welcome, Jane!")
    expect(page).to_not have_content("Login")
    expect(page).to have_content("Logout")

    click_on "Logout"
    expect(page).to have_content("Login")
  end
end
