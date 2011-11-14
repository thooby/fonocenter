class User < ActiveRecord::Base
  attr_accessible :nombre, :password_digest
  has_many :registros
end
