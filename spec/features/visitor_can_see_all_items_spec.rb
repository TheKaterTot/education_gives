require 'rails_helper'

feature 'Visitor can see all items' do
  scenario 'when they visit the donations page.' do
    donation1, donation2, donation3 = create_list(:donation, 3)
    visit donations_path

    expect(page).to have_content('All Donations')
    within("#donation-#{donation1.id}") do
      expect(page).to have_link(donation1.title, href: donation_path(donation1))
      expect(page).to have_content(donation1.price)
      expect(page).to have_css("img[src*='#{donation1.image_path}']")
    end
    within("div#donation-#{donation2.id}") do
      expect(page).to have_link(donation2.title, href: donation_path(donation2))
      expect(page).to have_content(donation2.price)
      expect(page).to have_css("img[src*='#{donation2.image_path}']")
    end
    within("div#donation-#{donation3.id}") do
      expect(page).to have_link(donation3.title, href: donation_path(donation3))
      expect(page).to have_content(donation3.price)
      expect(page).to have_css("img[src*='#{donation3.image_path}']")
    end
  end
end
