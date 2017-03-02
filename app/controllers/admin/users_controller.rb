class Admin::UsersController < Admin::BaseController
  before_action :current_admin?

  def show
    @users = User.all
    @statuses = Order.valid_statuses
    @orders = Order.where(status: status_query)
    @counts = Order.count_for_all_statuses
  end

  private

  def status_query
    params[:status].nil? ? @statuses : params[:status]
  end

end
#hound
