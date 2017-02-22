# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Donation.destroy_all

donation1 = Donation.create(title: "Bike to school",
                  description: "Transportation to get to school",
                  price: 50,
                  image_path: "")

donation2 = Donation.create(title: "School lunch",
                  description: "Monthly fee for school lunch",
                  price: 20,
                  image_path: "")
