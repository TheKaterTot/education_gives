class Admin::DonationsController < Admin::BaseController
  def new
    @donation = Donation.new
    @categories = Category.all
  end

  def create
    @donation = Donation.new(donation_params)
    @categories = Category.all
    if @donation.save
      redirect_to donation_path(@donation)
    else
      render :new
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:title, :description, :price, :image_path, :category_id)
  end
end
