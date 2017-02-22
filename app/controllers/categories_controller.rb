class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(name: params[:slug])
    @donations = @category.donations
  end

end