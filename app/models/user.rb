class User < ApplicationRecord
    has_secure_password  # Adds methods to set and authenticate with bcrypt
  
    has_many :todos, dependent: :destroy
    has_many :donations, dependent: :destroy
  
    validates :first_name, :last_name, :username, :email, :gender, presence: true
    validates :email, uniqueness: true
end
