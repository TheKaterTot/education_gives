class Admin::DonationsController < Admin::BaseController

  def index
    @donations = Donation.all
  end

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)
    if @donation.save
      redirect_to admin_donation_path(@donation)
    else
      flash[:danger] = @donation.errors.full_messages.join(". ")
      render :new
    end
  end

  def edit
    @donation = Donation.find(params[:id])
  end

  def show
    @donation = Donation.find(params[:id])
  end

  def update
    @donation = Donation.find(params[:id])
    @donation.update(donation_params)
    if @donation.save
      redirect_to admin_donation_path(@donation)
    else
      flash[:danger] = @donation.errors.full_messages.join(". ")
      render :edit
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:title, :description, :price, :image, :category_id)
  end
end
