class DonationsController < ApplicationController

  include ActionView::Helpers::TextHelper

  def index
    @donations = Donation.all
    @cart = Cart.new(session[:cart])
  end

  def show
    @donation = Donation.find(params[:id])
    @cart = Cart.new(session[:cart])
  end
end
