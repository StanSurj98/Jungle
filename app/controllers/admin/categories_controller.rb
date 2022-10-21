class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.order(id: :desc).all
    # Contains the number of products of a certain category
    @products_count = []
    @categories.each do |category|
      # find the # of products belonging to a category with "collections" syntax
      results = category.products.size
      # push to our array for counts
      @products_count << results
    end
    # found .zip(), pairs up two arrays and their data?
    @categories_and_counts = @categories.zip(@products_count)

  end

  def new
    @category = Category.new
  end

  def create
  end
end
