module RegistrosHelper
  def construct(data,users_dic)
    xm = Builder::XmlMarkup.new(:indent => 2)
    salida = ""
    xm.tr { data[0].keys.each { |key| xm.th(users_dic[key])}}
    data.each { |row| xm.tr { row.values.each { |value| xm.td(value)}}}
    salida += "#{xm}"
   end
   def lista_users
     users_dic=Hash.new    
     @users.each do |h|
       users_dic[h.id]=h.nombre
     end
     users_dic['fin']='Total'
     users_dic
   end
   def tabla_suma
     data = [@stats,@stats2,@stats3]
     salida=""
     data.each do |h|
       salida += '<h2>'+h[0]+'</h2><table class="index">'
       salida += construct(h[1..-1],lista_users)
       salida +="</table>"
     end     
     salida
   end
end
