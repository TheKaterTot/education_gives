class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :email, :password, presence: true
  validates :username, presence:true, uniqueness: true
  has_many :orders
end
