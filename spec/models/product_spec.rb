require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do



    context "with :name, :price_cents, :quantity and :category_id" do

      before(:context) do
        @category = Category.new("name" => "Cactus")
        @category.save!
      end

      it "saves successfully when all four are validated" do
        @product = Product.new(
          "name" => "Bunny Ear Cactus", 
          "price_cents" => 3000, 
          "quantity" => 15, 
          "category_id" => @category.id
        )
        @product.save!
        expect(@product.name).to be_present
      end

      it "expect :name error to be found inside .errors.full_messages array" do
        @product = Product.new(
          "name" => nil,
          "price_cents" => 3000, 
          "quantity" => 15, 
          "category_id" => @category.id
        )
        @product.save
      
        expect(@product.errors.full_messages).to be_present
      end

      it "expect :price_cents error to be found inside .errors.full_messages array" do
        @product = Product.new(
          "name" => "Bunny Ear Cactus",
          "price_cents" => nil, 
          "quantity" => 15, 
          "category_id" => @category.id
        )
        @product.save
      
        expect(@product.errors.full_messages).to be_present
      end

      it "expect :quantity error to be found inside .errors.full_messages array" do
        @product = Product.new(
          "name" => "Bunny Ear Cactus",
          "price_cents" => 3000, 
          "quantity" => nil, 
          "category_id" => @category.id
        )
        @product.save
      
        expect(@product.errors.full_messages).to be_present
      end

      it "expect :category_id error to be found inside .errors.full_messages array" do
        @product = Product.new(
          "name" => "Bunny Ear Cactus",
          "price_cents" => 3000, 
          "quantity" => 15, 
          "category_id" => nil
        )
        @product.save
      
        expect(@product.errors.full_messages).to be_present
      end



    
    end
  end
end
