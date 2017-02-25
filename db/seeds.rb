Donation.destroy_all
Category.destroy_all

music = Category.create(name: "music")
science = Category.create(name: "science")
library = Category.create(name: "library")

science.donations.create(title: "Bike to school",
                         description: "Transportation to get to school",
                         price: 50,
                         image_path: "#")

music.donations.create(title: "School lunch",
                       description: "Monthly fee for school lunch",
                       price: 20,
                       image_path: "#")

library.donations.create(title: "New Violin",
                         description: "Our music club needs new violins for the regional competition.",
                         price: 100.0,
                         image_path: "#")

science.donations.create(title: "New Microsope",
                         description: "We are expanding our science department to include a unit on microbiology.",
                         price: 200.0,
                         image_path: "#")

library.donations.create(title: "Library Books",
                         description: "We need to replace old, worn-out books for student free time.",
                         price: 50.0,
                         image_path: "#")

admin = FactoryGirl.create(:user, role: 1, username: "admin", password: "password")

10.times do
  f = Faker::Name.first_name
  l = Faker::Name.last_name
  u = "#{f.downcase}-#{l.downcase}"
  e = Faker::Internet.safe_email(u)
  User.create(first_name: f, last_name: l, email: e, username: u, password: "a")
end

30.times do
  u = User.pluck(:id).sample
  s = [:ordered, :paid, :completed, :cancelled].sample
  o = Order.create(user_id: u, status: s)
  n = rand(1..5)
  Donation.pluck(:id).sample(n).each do |d|
    q = rand(1..10)
    o.details.create(
      donation_id: d,
      quantity: q,
      subtotal: Donation.find(d).price * q
    )
  end
end
