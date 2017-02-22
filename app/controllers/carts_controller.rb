class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    donation = Donation.find(params[:donation_id])

    @cart.add_donation(donation.id)
    session[:cart] = @cart.contents
    flash[:success] = "You now have #{pluralize(@cart.count_of(donation.id), donation.title)}."
    redirect_to donations_path
  end

end
