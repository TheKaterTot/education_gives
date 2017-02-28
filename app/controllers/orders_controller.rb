class OrdersController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    if current_user
      @orders = current_user.orders
    else
      render :file => 'public/404.html', :status => :not_found, :layout => false
    end
  end

  def show
    @order = Order.find(params[:id])
    if @order && @order.user == current_user
      # @order = order
      redirect_to order_path(@order)
    else
      render :file => 'public/404.html', :status => :not_found, :layout => false
    end
  end

  def create
    order = Order.new(user: current_user)
    @cart.contents.each do |donation_id, quantity|
      donation = Donation.find(donation_id)
      order.donations << donation
    end
    if order.save
      session[:cart] = nil
      flash[:success] = "Order was successfully placed."
      redirect_to orders_path
    else
      redirect_to cart_index_path
    end
  end
end
