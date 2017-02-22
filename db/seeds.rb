# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Donation.destroy_all
Category.destroy_all

music = Category.create(name: "music")
science = Category.create(name: "science")
library = Category.create(name: "library")

donation1 = science.donations.create(title: "Bike to school",
                                     description: "Transportation to get to school",
                                     price: 50,
                                     image_path: "#")

donation2 = music.donations.create(title: "School lunch",
                                   description: "Monthly fee for school lunch",
                                   price: 20,
                                   image_path: "#")

donation3 = library.donations.create(title: "New Violin",
                                     description: "Our music club needs new violins for the regional competition.",
                                     price: 100.0,
                                     image_path: "#")

donation4 = science.donations.create(title: "New Microsope",
                                     description: "We are expanding our science department to include a unit on microbiology.",
                                     price: 200.0,
                                     image_path: "#")

donation5 = library.donations.create(title: "Library Books",
                                     description: "We need to replace old, worn-out books for student free time.",
                                     price: 50.0,
                                     image_path: "#")
