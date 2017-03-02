require "rails_helper"

RSpec.describe "Visitor can have limited access" do
  scenario "visitor cannot view other user's private data" do
    visit dashboard_path
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end

  scenario "visitor cannot view admin screens" do
    user = create(:user)

    visit admin_dashboard_path
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
