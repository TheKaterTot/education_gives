class OrdersController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:order_id])
  end

  def create
    # order = Order.new(username: "Rachel")
    # cart.contents.each do |donation_id, quantity|
    #   order.donations.new(donation_id: donation_id, quantity: quantity)
    # end

    if order.save
      session[:cart] = nil
      flash[:notice] = "Your cart is ready. You kindly chose to give #{cart.donations.count} donations."
      redirect_to donations_path
    else
      # implement if you have validations
    end
  end
end
