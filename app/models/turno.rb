class Turno < ActiveRecord::Base
  attr_accessible :descripcion
  has_many :registros
end
