class Admin::OrdersController < ApplicationController
  before_action :current_admin?

  def show
    @order = Order.find(params[:id])
    @donations = @order.donations
    @user = User.find(@order.user_id)
    # @quantities = []
    # @subtotals = []
    # @donations.each do |donation|
    #   order_donation = OrderDonation.find_by(donation_id: donation.id, order_id: @order.id)
    #   @quantities << order_donation.quantity
    #   @subtotals << order_donation.subtotal
    # end
  end

  def update
    order = Order.find(params[:id])
    order.update_attributes(status: order.next_status)
    redirect_to admin_dashboard_path
  end

  def destroy
    order = Order.find(params[:id])
    order.cancel
    redirect_to admin_dashboard_path
  end
end
