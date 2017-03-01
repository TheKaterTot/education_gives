class DonationsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    @donations = Donation.where(active: true)
  end

  def show
    @donation = Donation.find(params[:id])
  end
end
