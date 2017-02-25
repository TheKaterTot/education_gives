require 'rails_helper'

feature "Authenticated user security" do
  scenario "an authenticated user can't see another user's dashboard" do
    user = User.create(first_name: "Jane", last_name: "Doe", email: "janedoe@email.com", username: "janedoe", password: "password", role: 0)
    user2 = User.create(first_name: "John", last_name: "Doe", email: "johndoe@email.com", username: "johndoe", password: "password", role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Welcome Jane!")
    # save_and_open_page
    visit admin_path #is this the correct path?

    expect(page).to have_content("404")

  end
end


#
# issueThirteen:
#     title: Authenticated users security
#     body: >
#       Background: An authenticated user
#       As an Authenticated User
#       I cannot view another user's private data (current or past orders, etc)
#       I cannot view the administrator screens or use admin functionality
#       I cannot make myself an admin
