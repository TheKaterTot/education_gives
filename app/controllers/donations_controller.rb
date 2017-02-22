class DonationsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    @donations = Donation.all
  end

  # def create
  #   donation = Donation.find(params[:donation_id])
  #   flash[:notice] = "You now have 1 #{donation.title}."
  #   redirect_to donation_path(donation)
  # end

  def create
    donation = Donation.find(params[:donation_id])
    cart = session[:cart] || {}
    cart[donation.id.to_s] ||= 0
    cart[donation.id.to_s] += 1
    session[:cart] = cart
    flash[:notice] = "You now have #{pluralize(cart[donation.id.to_s], donation.title)}."
    redirect_to donations_path
  end

  def show
    @donation = Donation.find(params[:id])
  end
end
