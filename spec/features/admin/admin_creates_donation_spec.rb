require "rails_helper"

feature "admin manages donations" do
  scenario "admin creates new donation" do
    admin = create(:user, role: 1)
    create(:category, name: "Food")

    allow_any_instance_of(ApplicationController)
    .to receive(:current_user).and_return(admin)

    visit new_admin_donation_path

    fill_in "donation[title]", with: "School Lunches"
    fill_in "donation[description]", with: "Buy a child's lunch for a year"
    fill_in "donation[price]", with: "75"
    select "Food", from: "donation[category_id]"
    attach_file "donation[image_path]", "spec/fixtures/capybara.jpg"

    click_on "Create"

    expect(current_path).to eq(donation_path(Donation.last))
    expect(page).to have_content("School Lunches")
    expect(page).to have_content("Buy a child's lunch for a year")
    expect(page).to have_content("75")

  end
end
