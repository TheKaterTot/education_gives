class OrdersController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:order_id])
  end

  def create
    order = Order.new(user: current_user)
    @cart.contents.each do |donation_id, quantity|
      donation = Donation.find(donation_id)
      order.donations << donation
      make_order_donation(donation_id, order.id, quantity)
    end
    if order.save
      session[:cart] = nil
      flash[:notice] = "Order was successfully placed."
      redirect_to orders_path
    else
      # implement if you have validations
    end
  end

  private

  def make_order_donation(donation_id, order_id, quantity)
    OrderDonation.create(donation_id: donation_id, order_id: order_id, quantity: quantity)
  end
end
