class Donation < ApplicationRecord
  belongs_to :category
  has_many :order_details, class_name: "OrderDonation"
  has_many :orders, through: :order_details
  validates :title, :description, :price, :image_path, presence: true

  def subtotal(quantity)
    price * quantity
  end

  def self.active
    where(active: true)
  end
end
