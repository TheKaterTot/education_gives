require 'rails_helper'

RSpec.describe "Admin can filter orders by status" do
  let!(:ordered) { create(:order, status: "ordered") }
  let!(:paid) { create(:order, status: "paid") }
  let!(:completed) { create(:order, status: "completed") }
  let!(:cancelled) { create(:order, status: "cancelled") }

  scenario "by 'Ordered'" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_dashboard_path
    click_on "Ordered"

    expect(page).to have_css("#id-#{ordered.id}")
    expect(page).to_not have_css("#id-#{paid.id}")
    expect(page).to_not have_css("#id-#{completed.id}")
    expect(page).to_not have_css("#id-#{cancelled.id}")
  end

  scenario "by 'Paid'" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_dashboard_path
    click_on "Paid"

    expect(page).to_not have_css("#id-#{ordered.id}")
    expect(page).to have_css("#id-#{paid.id}")
    expect(page).to_not have_css("#id-#{completed.id}")
    expect(page).to_not have_css("#id-#{cancelled.id}")
  end

  scenario "by 'Completed'" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_dashboard_path
    click_on "Completed"

    expect(page).to_not have_css("#id-#{ordered.id}")
    expect(page).to_not have_css("#id-#{paid.id}")
    expect(page).to have_css("#id-#{completed.id}")
    expect(page).to_not have_css("#id-#{cancelled.id}")
  end

  scenario "by 'Cancelled'" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_dashboard_path
    click_on "Cancelled"

    expect(page).to_not have_css("#id-#{ordered.id}")
    expect(page).to_not have_css("#id-#{paid.id}")
    expect(page).to_not have_css("#id-#{completed.id}")
    expect(page).to have_css("#id-#{cancelled.id}")
  end
end
