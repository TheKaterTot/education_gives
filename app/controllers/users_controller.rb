class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Your account has been created."
      redirect_to dashboard_path
    else
      flash.now[:warning] = "Please try again."
      render :new
    end
  end

  def show
    if current_user
      @user = current_user
    else
      render :file => 'public/404.html', :status => :not_found, :layout => false
    end
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update_attributes(user_params)
    if current_user.save
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end
end
