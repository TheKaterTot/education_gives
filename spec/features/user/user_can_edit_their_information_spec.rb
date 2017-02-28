require 'rails_helper'

describe "User can update their information" do
  scenario "User change their information" do
    create(:user, first_name:"Jane", username: "jane", password: "password")

    visit login_path

    fill_in "Username", with: "jane"
    fill_in "Password", with: "password"
    click_on "Login"

    expect(page).to have_content("Welcome, Jane!")

    click_on "Update Account"

    fill_in "First name", with: "Fabiana"
    fill_in "Password", with: "password"

    click_on "Update User"

    expect(page).to have_content("Fabiana")
    expect(page).to_not have_content("Jane")
  end
end
