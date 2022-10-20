class Admin::DashboardController < ApplicationController
  # http_basic_authenticate_with name: ENV["ADMIN_NAME"], password: ENV["ADMIN_PASS"]
  def show
    @category_count = Category.count()
    @product_count = Product.count()
  end
end
