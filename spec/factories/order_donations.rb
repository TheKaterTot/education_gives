FactoryGirl.define do
  factory :order_donation do
    order
    donation
    quantity { 2 }
    subtotal { 1000 }
  end
end
