class Registro < ActiveRecord::Base

  attr_accessible :user_id, :fecha, :turno_id, :llamada, :ciber, :impresion, :claro, :movistar, :lugar_id
  belongs_to  :user
  belongs_to  :lugar
  belongs_to  :turno
  scope :ultimos_n_dias, lambda { |dias| where('(julianday("now")-julianday("fecha")) < ?',dias) }
  scope :sel_trozo,lambda {|fech1,fech2| where("(date('registros'.'fecha') >= ?) and (date('registros'.'fecha') <= ?)",fech1,fech2)}
  scope :sel_dia,lambda {|fech1| where("(date('registros'.'fecha') = ?) ",fech1)}
  
    @mes_nom = {
      1 => "Enero",
      2 => "Febrero",
      3 => "Marzo",
      4 => "Abril",
      5 => "Mayo",
      6 => "Junio",
      7 => "Julio",
      8 => "Agosto",
      9 => "Septiembre",
      10 => "Octubre",
      11 => "Noviembre",
      12 => "Diciembre"
   }
  
  def self.informe_op(gap,stat_op)   
    case stat_op
      when 1
        @sal =  self.informe_mes(gap)   
      when 2
        @sal = self.informe_hasta_dia(gap) 
      when 3
        @sal = self.informe_dias(30)
      when 4
        @sal = self.informe
      when 5
        @sal = self.informe_dia(gap)
      when 6
        @sal = self.informe_resumen_hasta_dia(gap)
      else
        @sal ="" 
      end
    end
        
  def self.informe_mes(gap) 
   
    o=ActiveSupport::OrderedHash.new 
    f=Hash.new
    salida=["Informe del mes de #{@mes_nom[gap.month]}"] 
    rubros = ['llamada','ciber','impresion','claro','movistar']
    rubros.each do |rubro|
      f['fin'] = self.sel_trozo(gap.at_beginning_of_month,gap.at_end_of_month).sum(rubro)    
      o['inicio'] = rubro.capitalize
      z = o.merge(self.sel_trozo(gap.at_beginning_of_month,gap.at_end_of_month).sum(rubro, :group => 'user_id').merge(f))
      salida <<z
    end
    salida
  end
  def self.informe_hasta_dia(gap)    
    o=ActiveSupport::OrderedHash.new 
    f=Hash.new
    salida=["Informe del mes de #{@mes_nom[gap.month]} hasta el dia #{gap}"]
    rubros = ['llamada','ciber','impresion','claro','movistar']
    rubros.each do |rubro|
      f['fin'] = self.sel_trozo(gap.at_beginning_of_month,gap).sum(rubro)    
      o['inicio'] = rubro.capitalize
      z = o.merge(self.sel_trozo(gap.at_beginning_of_month,gap).sum(rubro, :group => 'user_id').merge(f))
      salida <<z
    end
    salida
   
  end
  def self.informe_resumen_hasta_dia(gap)    
    o=ActiveSupport::OrderedHash.new 
    salida=["Informe resumen del mes de #{@mes_nom[gap.month]} hasta el dia #{gap}"]
    rubros = ['llamada','ciber','impresion','claro','movistar']
    rubros.each do |rubro|
      f = self.sel_trozo(gap.at_beginning_of_month,gap).sum(rubro) 
      salida << f   
    end
    p salida
    salida1=[]
    salida1[0] = salida[0]
    salida1[1] = salida[1] + salida[2] + salida[3]
    salida1[2] = salida[4]
    salida1[3] = salida[5]
    salida1 
  end
  def self.informe_dia(fecha)
    lista_dia = self.sel_dia(fecha).order(:lugar_id,:turno_id)
    lugar_id = 0
    @salida = []
    @sal_item= []
    lista_dia.each do |z|  
      if z.lugar_id != lugar_id
        @salida << @sal_item if @sal_item != []
        lugar_id = z.lugar_id
        @sal_item = [z.lugar.nombre, 
                    z.llamada.to_i+z.ciber.to_i+z.impresion.to_i, 
                    z.claro.to_i, 
                    z.movistar.to_i]
      else
        @sal_item[1] += z.llamada.to_i + z.ciber.to_i + z.impresion.to_i
        @sal_item[2] += z.claro.to_i 
        @sal_item[3] += z.movistar.to_i
      end
    end
    @salida << @sal_item
    p @salida
    @salida
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
