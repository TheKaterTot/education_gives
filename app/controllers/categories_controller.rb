class CategoriesController < ApplicationController

  def show
    if Category.find_by(name: params[:slug])
      @category = Category.find_by(name: params[:slug])
      @donations = @category.donations
    else
      render file: '/public/404'
    end
  end
end
