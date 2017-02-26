require 'rails_helper'

describe Order do
  it { should belong_to(:user) }
  it { should have_many(:details) }
  it { should have_many(:donations) }

  describe "#cancellable" do
    context "when it is paid" do
      it "returns true" do
        order = create(:order, status: "paid")

        expect(order.cancellable?).to be true
      end
    end

    context "when it is ordered" do
      it "returns true" do
        order = create(:order, status: "ordered")

        expect(order.cancellable?).to be true
      end
    end

    context "when it is completed" do
      it "returns false" do
        order = create(:order, status: "completed")

        expect(order.cancellable?).to be false
      end
    end

    context "when it is cancelled" do
      it "returns false" do
        order = create(:order, status: "cancelled")

        expect(order.cancellable?).to be false
      end
    end
  end

  describe "#completed" do
    context "when it is completed" do
      it "returns true" do
        order = create(:order, status: "completed")

        expect(order.completed?).to be true
      end
    end

    context "when it is not completed" do
      it "returns false" do
        order = create(:order, status: "paid")

        expect(order.completed?).to be false
      end
    end
  end

  describe "#cancel" do
    it "cancels the order" do
      order = create(:order, status: "paid")
      order.cancel

      expect(order.reload.status).to eq("cancelled")
    end
  end

  describe "#next_status" do
    context "when it is ordered" do
      it "returns paid" do
        order = create(:order, status: "ordered")

        expect(order.next_status).to eq("paid")
      end
    end

    context "when it is paid" do
      it "returns completed" do
        order = create(:order, status: "paid")

        expect(order.next_status).to eq("completed")
      end
    end

    context "when it is completed" do
      it "returns nil" do
        order = create(:order, status: "completed")

        expect(order.next_status).to be nil
      end
    end
  end

  describe "#cancelled?" do
    context "when it's cancelled" do
      it "returns true" do
        order = create(:order, status: "cancelled")

        expect(order.cancelled?).to be true
      end
    end

    context "when it's not cancelled" do
      it "returns false" do
        order = create(:order, status: "paid")

        expect(order.cancelled?).to be false
      end
    end
  end
end
