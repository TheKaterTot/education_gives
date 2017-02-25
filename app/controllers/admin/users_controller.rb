class Admin::UsersController < Admin::BaseController
  before_action :current_admin?

  def show
    @users = User.all
    @orders = Order.all
  end

end
