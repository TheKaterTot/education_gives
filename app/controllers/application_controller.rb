class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart
  before_action :set_categories

  helper_method :current_user
  helper_method :current_admin?
  helper_method :set_categories

  def set_cart
    @cart = Cart.new(session[:cart] || {})
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def set_categories
    @categories ||= Category.order(:name)
  end
end
#hound
