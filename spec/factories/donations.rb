FactoryGirl.define do
  factory :donation do
    sequence :title do |n|
      "New Computer #{n - 1}"
    end
    description "We need new computers for computer class."
    price 500.0
    image { File.open("spec/fixtures/capybara.jpg") }
    active true
    category
  end
end
