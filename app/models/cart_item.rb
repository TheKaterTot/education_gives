class CartItem
  attr_reader :id, :quantity

  delegate :title, :price, :image, to: :donation

  def initialize(id, quantity)
    @id = id
    @quantity = quantity
  end

  def subtotal
    donation.price * quantity
  end

  def image_url
    image.url(:thumb)
  end

  private

  def donation
    @donation ||= Donation.find(id)
  end
end
