require 'rails_helper'

RSpec.describe "Visitor has limited access" do
  scenario "visitor cannot view other user's private data" do
    visit dashboard_path
    expect(page).to have_content("404")
  end

  #### pending to know if we need to have a test for visitor redirect to login, can't checkout

  scenario "visitor cannot view admin screens" do
    user = create(:user)

    visit admin_dashboard_path
    expect(page).to have_content("404")
  end
end
