module RegistroFinders
def self.informe_mes(gap)  
  o=ActiveSupport::OrderedHash.new 
  f=Hash.new
  salida=["Informe del mes #{gap.month}"] 
  rubros = ['llamada','ciber','impresion','claro','movistar']
  rubros.each do |rubro|
    f['fin'] = self.meses(gap).sum(rubro)    
    o['inicio'] = rubro.capitalize
    salida <<o.merge(self.meses(gap).sum(rubro, :group => 'user_id').merge(f))
  end
  salida
end
end