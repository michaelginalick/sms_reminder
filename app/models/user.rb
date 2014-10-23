class User < ActiveRecord::Base
  attr_accessible :email, :username, :phone, :password
  has_many :tasks
  has_secure_password
  validates :email, uniqueness: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "has wrong format"}
  validates :username, presence: true
  validates :phone, presence: true
  validates :password, :length => {:minimum => 6}

end
