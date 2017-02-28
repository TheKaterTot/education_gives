class Donation < ApplicationRecord
  belongs_to :category
  has_many :order_details, class_name: "OrderDonation"
  has_many :orders, through: :order_details
  validates :title, :description, :price, presence: true
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/assets/:style/classroom.jpg"
  validates_attachment_content_type :image,
    :content_type => ["image/jpg", "image/jpeg", "image/png"]

  def subtotal(quantity)
    price * quantity
  end

  def self.active
    where(active: true)
  end
end
