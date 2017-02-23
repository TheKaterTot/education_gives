class Donation < ApplicationRecord
  belongs_to :category
  validates :title, :description, :price, :image_path, presence: true

  def subtotal(quantity)
    self.price * quantity
  end
end
