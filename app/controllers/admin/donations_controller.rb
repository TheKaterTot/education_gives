class Admin::DonationsController < Admin::BaseController

  def index
    @donations = Donation.all
  end

  def new
    @donation = Donation.new
    @categories = Category.all
  end

  def create
    @donation = Donation.new(donation_params)
    @categories = Category.all
    if @donation.save
      redirect_to admin_donation_path(@donation)
    else
      render :new
    end
  end

  def edit
    @donation = Donation.find(params[:id])
    @categories = Category.all
  end

  def show
    @donation = Donation.find(params[:id])
    @categories = Category.all
  end

  def update
    @donation = Donation.find(params[:id])
    @donation.update(donation_params)
    if @donation.save
      redirect_to admin_donation_path(@donation)
    else
      render :edit
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:title, :description, :price, :image, :category_id)
  end
end
