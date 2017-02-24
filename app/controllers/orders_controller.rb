class OrdersController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:order_id])
  end

  def create
    user = User.find(session[:user_id])
    order = Order.new(user: user)
     @cart.contents.each do |donation_id, quantity|
       order.donations.new(id: donation_id)
       OrderDonation.new(order_id: order.id, donation_id: donation_id, quantity: quantity)
     end

    if order.save
      session[:cart] = nil
      flash[:notice] = "Your cart is ready. You kindly chose to give #{cart.donations.count} donations."
      redirect_to donations_path
    else
      # implement if you have validations
    end
  end
end
