FactoryGirl.define do
  factory :user do
    sequence :first_name do |n|
      "FirstName#{n}"
    end
    sequence :last_name do |n|
      "LastName#{n}"
    end
    sequence :email do |n|
      "Email#{n}"
    end
    sequence :username do |n|
      "username#{n}"
    end
    password "password"
  end
end
