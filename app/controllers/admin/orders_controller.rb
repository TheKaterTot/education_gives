class Admin::OrdersController < ApplicationController
  before_action :current_admin?

  def update
    order = Order.find(params[:id])
    order.update_attributes(status: params[:order][:status])
    redirect_to admin_dashboard_path
  end

  def destroy
    order = Order.find(params[:id])
    order.cancel
    redirect_to admin_dashboard_path
  end
end
