class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["USERNAME"],
  password: ENV["PASSWORD"]

  def show
  @products = Product.count(:all)
   @category = Category.count(:all)
  end
end
