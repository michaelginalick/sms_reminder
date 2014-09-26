class User < ActiveRecord::Base
  attr_accessor :email, :name, :phone
  
  validates :name, presence: true
  validates :email, uniqueness: true, format: {with:/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "has wrong format"}  
  validates :phone, presence: true, uniqueness: true
end
