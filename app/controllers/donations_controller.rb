class DonationsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    @donations = Donation.all
    @cart = Cart.new(session[:cart])
  end

  # def create
  #   donation = Donation.find(params[:donation_id])
  #
  #   @cart.add_donation(donation.id)
  #   session[:cart] = @cart.contents
  #
  #   flash[:notice] = "You now have #{pluralize(@cart.count_of(donation.id), donation.title)}."
  #   redirect_to donations_path
  # end

  def show
    @donation = Donation.find(params[:id])
    @cart = Cart.new(session[:cart])
  end
end
