require 'rails_helper'

RSpec.describe "User sees all orders" do
  xscenario "user can see all orders" do
    user = create(:user)
    #make the user an admin
    order1 = create(:order)
    #make this order ordered
    order2 = create(:order)
    #make this order paid
    order3 = create(:order)
    #make this order cancelled
    order4 = create(:order)
    #make this order completed

    visit dashboard_path

    expect(page).to have_content("All Orders")
    expect(page).to have_content("#{order1.donation}")
    expect(page).to have_selector(:link_or_button, "#{order1.donation}")
    expect(page).to have_selector(:link_or_button, "Paid")
    expect(page).to have_selector(:link_or_button, "Cancel")
    expect(page).to have_selector(:link_or_button, "Mark as paid")
    expect(page).to have_selector(:link_or_button, "Mark as completed")
  end
end
