class Order < ApplicationRecord
  belongs_to :user
  has_many :details, class_name: "OrderDonation"
  has_many :donations, through: :details

  def display_create_date
    created_at.strftime("%m-%d-%Y")
  end

  def total
    details.sum(:subtotal)
  end
end
