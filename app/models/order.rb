class Order < ApplicationRecord
  belongs_to :user
  has_many :details, class_name: "OrderDonation"
  has_many :donations, through: :details
end
