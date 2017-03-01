require 'rails_helper'

RSpec.describe "Visitor has limited access" do
  scenario "visitor cannot view other user's private data" do
    visit dashboard_path
    expect(page).to have_content("404")
  end

  scenario "visitor cannot view admin screens" do
    user = create(:user)

    visit admin_dashboard_path
    expect(page).to have_content("404")
  end
end
