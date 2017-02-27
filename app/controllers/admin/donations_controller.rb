class Admin::DonationsController < Admin::BaseController
  def new
    @donation = Donation.new
  end

  def create
    donation = Donation.new(donation_params)
    if donation.save
      redirect_to admin_donation_path(donation)
    else
      render :new
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:title, :description, :price, :image)
  end
end
