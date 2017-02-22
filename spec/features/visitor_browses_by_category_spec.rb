require "rails_helper"

feature 'Visitor can browse by category' do
  scenario 'by entering a category name into the url.' do
    category = create(:category, name: 'art-history')
    donation1, donation2, donation3 = create_list(:donation, 3, category: category)
    visit "/art-history"

    expect(page).to have_content('All Art History Donations')

    within("#donation-#{donation1.id}") do
      expect(page).to have_link(donation1.title, href: donation_path(donation1))
      expect(page).to have_content(donation1.price)
      expect(page).to have_css("img[src*='#{donation1.image_path}']")
    end
    within("#donation-#{donation2.id}") do
      expect(page).to have_link(donation2.title, href: donation_path(donation2))
      expect(page).to have_content(donation2.price)
      expect(page).to have_css("img[src*='#{donation2.image_path}']")
    end
    within("#donation-#{donation3.id}") do
      expect(page).to have_link(donation3.title, href: donation_path(donation3))
      expect(page).to have_content(donation3.price)
      expect(page).to have_css("img[src*='#{donation3.image_path}']")
    end
  end

  scenario 'by entering a different category name into the url.' do
    category = create(:category, name: 'science')
    donation1, donation2, donation3 = create_list(:donation, 3, category: category)
    visit "/science"

    expect(page).to have_content('All Science Donations')

    within("#donation-#{donation1.id}") do
      expect(page).to have_link(donation1.title, href: donation_path(donation1))
      expect(page).to have_content(donation1.price)
      expect(page).to have_css("img[src*='#{donation1.image_path}']")
    end
    within("#donation-#{donation2.id}") do
      expect(page).to have_link(donation2.title, href: donation_path(donation2))
      expect(page).to have_content(donation2.price)
      expect(page).to have_css("img[src*='#{donation2.image_path}']")
    end
    within("#donation-#{donation3.id}") do
      expect(page).to have_link(donation3.title, href: donation_path(donation3))
      expect(page).to have_content(donation3.price)
      expect(page).to have_css("img[src*='#{donation3.image_path}']")
    end
  end
end
