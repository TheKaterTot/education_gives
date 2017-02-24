class OrderDonation < ApplicationRecord
  belongs_to :order
  belongs_to :donation
end
