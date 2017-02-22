FactoryGirl.define do
  factory :donation do
    sequence :title do |n|
      "New Computer #{n - 1}"
    end
    description "We need new computers for computer class."
    price 500.0
    image_path "https://pixabay.com/p-147953/"
    category
  end
end
