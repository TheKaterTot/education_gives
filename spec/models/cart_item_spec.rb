require "rails_helper"

describe CartItem do
  let(:donation) do
    create(:donation, title: "Nice things", price: 10)
  end

  subject { CartItem.new(donation.id, 5) }

  describe "#subtotal" do
    it "returns the subtotal" do
      expect(subject.subtotal).to eq(50)
    end
  end

  describe "#title" do
    it "returns the donation title" do
      expect(subject.title).to eq("Nice things")
    end
  end

  describe "#price" do
    it "returns the donation price" do
      expect(subject.price).to eq(10)
    end
  end

  describe "#image_url" do
    it "returns the image" do
      expect(subject.image_url).to eq(donation.image.url(:thumb))
    end
  end
end

