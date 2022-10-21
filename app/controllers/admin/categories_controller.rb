class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.order(id: :desc).all
    # Contains the number of products of a certain category
    @num_of_prods = []
    @products_count = @categories.each do |category|
      results = category.products.size
      puts results
      @num_of_prods << results
    end

    @result = @categories.zip(@num_of_prods)

  end

  def new
    @category = Category.new
  end

  def create
  end
end
