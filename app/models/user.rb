class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :email, :password, presence: true
  validates :username, presence:true, uniqueness: true
  has_many :orders

  enum ({role: [:default, :admin]})

  def full_name
    "#{first_name} #{last_name}"
  end
end
#hound
