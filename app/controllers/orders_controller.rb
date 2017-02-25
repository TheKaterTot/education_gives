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
    end
    if order.save
      session[:cart] = nil
      flash[:notice] = "Order was successfully placed."
      redirect_to orders_path
    else
      redirect_to cart_index_path
    end
  end
end
