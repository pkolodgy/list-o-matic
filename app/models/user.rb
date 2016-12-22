class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password, length: {minimum: 6}

  has_many :lists
end
