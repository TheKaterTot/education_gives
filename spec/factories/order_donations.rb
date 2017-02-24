FactoryGirl.define do
  factory :order_donation do
    order
    donation
    quantity { rand(1..10) }
  end
end
