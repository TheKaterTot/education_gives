class Admin::BaseController < ApplicationController
  before_action :current_admin

  def current_admin
    render file: '/public/404' if !current_user || current_user.role != "admin"
    current_admin?
  end
end
