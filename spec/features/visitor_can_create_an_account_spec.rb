require 'rails_helper'

RSpec.feature "A visitor can create an account" do
  scenario "as a visitor I can visit the create an account page" do
    visit "/"
    expect(page).to have_link("Sign in or")

    click_on "Sign in or"
    expect(page).to have_content("If you have an account, please login")
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
    expect(page).to have_link("Create Account")
  end

  scenario "as a visitor I can create an account" do
    visit "/login"
    click_on "Create Account"

    fill_in("First name", :with => "Jane")
    fill_in("Last name", :with => "Doe")
    fill_in("Email", :with => "janedoe@email.com")
    fill_in("Username", :with => "janedoe")
    fill_in("Password", :with => "password")

    click_on "Submit"
    current_path.should == "/dashboard"

    expect(page).to have_content("Logged in as Jane Doe")
    expect(page).to have_content("My Profile")
    expect(page).to_not have_content("Login")
  end
end

    # And I should see my profile information
