class Registro < ActiveRecord::Base

  attr_accessible :user_id, :fecha, :turno_id, :llamada, :ciber, :impresion, :claro, :movistar, :lugar_id
  belongs_to  :user
  belongs_to  :lugar
  belongs_to  :turno
  scope :ultimos_n_dias, lambda { |dias| where('(julianday("now")-julianday("fecha")) < ?',dias) }
  scope :meses, lambda { |fechames| where("(date('registros'.'fecha','start of month','-1 day') < ?) and  (date('registros'.'fecha','+1 month') > ?)",fechames,fechames) }
  scope :sel_trozo,lambda {|fech1,fech2| where("(date('registros'.'fecha') >= ?) and (date('registros'.'fecha') <= ?)",fech1,fech2)}
  def self.informe_mes(gap)  
    o=ActiveSupport::OrderedHash.new 
    f=Hash.new
    salida=["Informe del mes #{gap.month}"] 
    rubros = ['llamada','ciber','impresion','claro','movistar']
    rubros.each do |rubro|
      f['fin'] = self.meses(gap).sum(rubro)    
      o['inicio'] = rubro.capitalize
      z = o.merge(self.meses(gap).sum(rubro, :group => 'user_id').merge(f))
      salida <<z
    end
    salida
  end
 def self.trozo(fecha_ini,fecha_fin)
   registros=self.sel_trozo(fecha_ini,fecha_fin)
   puts "kkkkkkk"
   p registros
   puts "llllllll"
   registros
 end
  def self.informe_dias(gap)  
    o=ActiveSupport::OrderedHash.new 
    f=Hash.new
    salida=["Informe de los últimos #{gap} dias"] 
    rubros = ['llamada','ciber','impresion','claro','movistar']
    rubros.each do |rubro|
      f['fin'] = self.ultimos_n_dias(gap).sum(rubro)    
      o['inicio'] = rubro.capitalize
      z = o.merge(self.ultimos_n_dias(gap).sum(rubro, :group => 'user_id').merge(f))
      salida <<z
    end
    salida
  end
  def self.informe  
    o=ActiveSupport::OrderedHash.new 
    f=Hash.new
    salida=["Informe Global"] 
    rubros = ['llamada','ciber','impresion','claro','movistar']
    rubros.each do |rubro|
      f['fin'] = self.sum(rubro)    
      o['inicio'] = rubro.capitalize
      z = o.merge(self.sum(rubro, :group => 'user_id').merge(f))
      salida <<z
    end
    salida
   end
end
