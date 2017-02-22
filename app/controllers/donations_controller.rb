class DonationsController < ApplicationController
  def index
    @donations = Donation.all
  end
  def show
    
  end
end
