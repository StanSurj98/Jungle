require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "Validations" do 
    context "signing up with password and password_confirmation fields" do

      it "creates a new user when both fields match" do
        @user = User.new(
          "first_name" => "John", 
          "last_name" => "Doe", 
          "email" => "john_doe@gmail.com", 
          "password" => "password", 
          "password_confirmation" => "password"
        )
        @user.save

        expect(@user).to be_valid
      end

      it "raises an error when fields do not match" do
        @user = User.new(
          "first_name" => "John", 
          "last_name" => "Doe", 
          "email" => "john_doe@gmail.com", 
          "password" => "password", 
          "password_confirmation" => "not_matching"
        )
        @user.save

        expect(@user).to be_invalid
      end

    end

    context "signing up with emails" do
      before do
        @user1 = User.new(
          "first_name" => "John", 
          "last_name" => "Doe", 
          "email" => "john_doe@gmail.com", 
          "password" => "password", 
          "password_confirmation" => "password"
        )
        @user1.save
      end

      it "raises error if email is not unique" do
        @user2 = User.new(
          "first_name" => "John", 
          "last_name" => "Doe", 
          "email" => "joHn_dOe@gmAil.COM", 
          "password" => "password", 
          "password_confirmation" => "password"
        )
        @user2.save

        expect(@user2).to be_invalid
      end
    end





  end



end
