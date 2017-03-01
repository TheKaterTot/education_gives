class DonationsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    @donations = Donation.all
    @donations2 = Donation.all.each_slice(4).to_a
  end

  def show
    @donation = Donation.find(params[:id])
  end
end
