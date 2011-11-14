class Lugar < ActiveRecord::Base
  attr_accessible :nombre
  has_many :registros
end
