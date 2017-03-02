class CategoriesController < ApplicationController

  def show
    if Category.find_by(name: params[:slug])
      @category = Category.find_by(name: params[:slug])
      @donations = @category.donations
    else
      render :file => 'public/404.html', :status => :not_found, :layout => false
    end
  end
end
