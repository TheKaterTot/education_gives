require 'rails_helper'

describe "Admin views links for all items" do
  scenario "Admin sees links to Donations at Admin Dashboard" do
    admin = create(:user, username: "admin", password: "password", role: 1)

    visit login_path

    fill_in "Username", with: "admin"
    fill_in "Password", with: "password"
    click_on "Login"

    expect(page).to have_content("Admin Dashboard")
    expect(page).to have_link("View all Donations")

    click_on "View all Donations"

    expect(current_path).to eq(admin_donations_path)
  end

  scenario "Admin can see a table with all donations" do
    admin = create(:user, username: "admin", password: "password", role: 1)
    donations = create_list(:donation, 5)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_donations_path

    expect(page).to have_content("All Donations")

    donations.each do |donation|
      within("#admin-donation-#{donation.id}") do
        expect(page).to have_css("img[src*='#{donation.image_path}']")
        expect(page).to have_content(donation.title)
        expect(page).to have_content(donation.description)
        expect(page).to have_content(donation.display_active)
        expect(page).to have_link("Edit", href: edit_admin_donation_path(donation))
      end
    end
  end
end
