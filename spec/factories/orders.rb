FactoryGirl.define do
  factory :order do
    user
    status { ["ordered", "paid", "completed", "cancelled"].sample }

    factory :order_with_donations do
      transient do
        donations_count 3
      end

      after(:create) do |order, evaluator|
        create_list(:order_donation, evaluator.donations_count, order: order)
      end
    end
  end
end
