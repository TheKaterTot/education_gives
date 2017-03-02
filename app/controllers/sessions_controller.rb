class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in successfully."
      if current_admin?
        redirect_to admin_dashboard_path
      else
        redirect_to dashboard_path
      end
    else
      flash.now[:danger] = "Your login attempt was incorrect. Please try again."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You are now logged out."
    redirect_to login_path
  end
end
#hound
