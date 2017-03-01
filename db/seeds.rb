music = Category.create(name: "music")
science = Category.create(name: "science")
library = Category.create(name: "library")
daily = Category.create(name: "daily-necessities")

daily.donations.create(
  title: "Bike",
  description: "You can give a student transportation to get to school.",
  price: 50,
  image_path: "https://robohash.org/hash"
)

daily.donations.create(
  title: "Notebooks & Pencils",
  description: "We need notebooks and pencils for our students who are unable to afford them.",
  price: 50,
  image_path: "https://robohash.org/hash"
)

daily.donations.create(
  title: "School Lunch",
  description: "Buy a month of healthy school lunches for a student.",
  price: 20,
  image_path: "https://robohash.org/lunch"
)

music.donations.create(
  title: "Violin",
  description: "Our music club needs new violins for the regional competition.",
  price: 100.0,
  image_path: "https://robohash.org/violin"
)

science.donations.create(
  title: "Microsope",
  description: "We are expanding our science department to include a unit on microbiology.",
  price: 200.0,
  image_path: "https://robohash.org/microscope"
)

library.donations.create(
  title: "Library Books",
  description: "We need to replace old, worn-out books for student free time.",
  price: 50.0,
  image_path: "https://robohash.org/library"
)

User.create(
  first_name: "Mario",
  last_name: "Smith",
  email: "mario.smith@example.com",
  role: 1, username: "user",
  password: "password"
)

9.times do
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

User.create(
  first_name: "Maria",
  last_name: "Smith",
  email: "maria.smith@eg.org",
  role: 1, username: "admin",
  password: "password"
)
