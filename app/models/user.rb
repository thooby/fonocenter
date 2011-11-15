class User < ActiveRecord::Base
  attr_accessible :nombre, :password, :password_confirmation
  has_many :registros
  has_secure_password
  validates_presence_of :password, :on => :create
end
