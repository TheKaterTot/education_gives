class DonationsController < ApplicationController
  def index
    @donations = Donation.all
  end

  def create
    donation = Donation.find(params[:donation_id])
    flash[:notice] = "You now have 1 #{donation.title}."
    redirect_to donation_path(donation)
  end

  def show
    @donation = Donation.find(params[:id])
  end
end
