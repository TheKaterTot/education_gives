FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence :email do |n|
      "email-#{n}@example.com"
    end
    sequence :username do |n|
      "username#{n}"
    end
    password "password"
  end
end
