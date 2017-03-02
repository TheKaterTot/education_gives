class Admin::BaseController < ApplicationController
  before_action :current_admin

  def current_admin
    if !current_user || current_user.role != "admin"
      render file: 'public/404.html', status: :not_found, layout: false
    else
      current_admin?
    end
  end
end
