require 'rails_helper'

RSpec.describe "Admin edits a donation" do
  scenario "admin can edit a donation" do

    admin = create(:user, role: 1)
    create(:category, name: "Food")
    donation = create(:donation)

    allow_any_instance_of(ApplicationController)
    .to receive(:current_user).and_return(admin)

    visit admin_donations_path
    click_on "Edit Donation"

    # page(current_path).to eq edit_admin_donation_path(donation)

    fill_in "donation[price]", with: "65"
    click_on "Update"

    expect(current_path).to eq donation_path(donation)
    expect(page).to have_content("65")
  end
end
