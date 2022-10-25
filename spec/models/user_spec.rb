require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "Validations" do 
    context "password and password_confirmation fields" do

      it "creates a new user if both fields match" do
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

      it "raises an error if fields do not match" do
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

    context "signing up through email" do
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

      it "raises an error if email is not unique" do
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

    context "filling relevant fields" do

      it "saves successfully if all fields present" do
        @user = User.new(
          "first_name" => "Jane", 
          "last_name" => "Doe", 
          "email" => "jane_doe@gmail.com", 
          "password" => "password", 
          "password_confirmation" => "password"
        )
        @user.save

        expect(@user.errors.full_messages).not_to be_present
      end

      it "raises :first_name error if First Name is missing" do
        @user = User.new(
          "first_name" => nil, 
          "last_name" => "Doe", 
          "email" => "jane_doe@gmail.com", 
          "password" => "password", 
          "password_confirmation" => "password"
        )
        @user.save

        expect(@user.errors.full_messages).to be_present
      end
      
      it "raises :first_name error if First Name is missing" do
        @user = User.new(
          "first_name" => nil, 
          "last_name" => "Doe", 
          "email" => "jane_doe@gmail.com", 
          "password" => "password", 
          "password_confirmation" => "password"
        )
        @user.save

        expect(@user.errors.full_messages).to be_present
      end

      it "raises :last_name error if Last Name is missing" do
        @user = User.new(
          "first_name" => "Jane", 
          "last_name" => nil, 
          "email" => "jane_doe@gmail.com", 
          "password" => "password", 
          "password_confirmation" => "password"
        )
        @user.save

        expect(@user.errors.full_messages).to be_present
      end

      it "raises :email error if Email is missing" do
        @user = User.new(
          "first_name" => "Jane", 
          "last_name" => "Doe", 
          "email" => nil, 
          "password" => "password", 
          "password_confirmation" => "password"
        )
        @user.save

        expect(@user.errors.full_messages).to be_present
      end

      it "raises :password error if Password is missing" do
        @user = User.new(
          "first_name" => "Jane", 
          "last_name" => "Doe", 
          "email" => "jane_doe@gmail.com", 
          "password" => nil, 
          "password_confirmation" => "password"
        )
        @user.save

        expect(@user.errors.full_messages).to be_present
      end

      it "raises :password_confirmation error if Password Confirmation is missing" do
        @user = User.new(
          "first_name" => "Jane", 
          "last_name" => "Doe", 
          "email" => "jane_doe@gmail.com", 
          "password" => "password", 
          "password_confirmation" => nil
        )
        @user.save

        expect(@user.errors.full_messages).to be_present
      end

    end





  end



end
