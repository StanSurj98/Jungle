class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, 
            :last_name, 
            :password_confirmation, 
            presence: true
  validates :password, presence: true, length: {minimum: 3}            
end
