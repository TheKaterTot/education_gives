class CartController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
  end

  def create
    donation = Donation.active.find(params[:donation_id])

    @cart.add_donation(donation.id)
    session[:cart] = @cart.contents

    flash[:success] = "You now have #{pluralize(@cart.count_of(donation.id), donation.title)}."
    redirect_to donations_path
  end

  def update
    if @cart.update_quantity(params[:id], params[:cart][:quantity])
      session[:cart] = @cart.contents
      redirect_to cart_index_path
    else
      flash[:danger] = "Quantity must be greater than 1."
      redirect_to cart_index_path
    end
  end

  def destroy
    donation = Donation.active.find(params[:id])
    link = view_context.link_to donation.title, donation_path(donation)
    @cart.remove_item(donation.id)
    flash[:success] = "Successfully removed #{link} from your cart."
    redirect_to cart_index_path
  end
end
