require 'rails_helper'

RSpec.describe "Admin edits a donation" do
  scenario "admin can edit a donation" do

    admin = create(:user, role: 1)
    create(:category)
    donation = create(:donation)

    allow_any_instance_of(ApplicationController)
    .to receive(:current_user).and_return(admin)

    visit admin_donation_path(donation)
    click_on "Edit Donation"

    fill_in "donation[price]", with: "65"
    click_on "Update Donation"

    expect(current_path).to eq admin_donation_path(donation)
    expect(page).to have_content("65")
  end
end
