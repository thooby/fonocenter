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
     data = [@stats3,@stats,@stats2]
     salida=""
     data.each do |h|
       salida += '<h2>'+h[0]+'</h2><table class="index">'
       salida += construct(h[1..-1],lista_users)
       salida +="</table>"
     end     
     salida
   end
   def admin_reg(registro)
     if current_user.nombre=='Fono' then
     sal = "<td>#{link_to 'Mostrar', registro}</td><td>#{link_to 'Cambiar', edit_registro_path(registro)}</td>
         <td> #{link_to 'Eliminar', registro, :confirm => '¿Está usted seguro?', :method => :delete}</td>"
       end
   end
   
end
