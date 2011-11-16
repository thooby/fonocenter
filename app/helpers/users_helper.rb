module UsersHelper
  def resumen_media
    media = Array.new
    media[0] = @user.registros.average(:llamada)
    media[1] = @user.registros.average(:ciber)
    media[2] = @user.registros.average(:impresion)
    media[3] = @user.registros.average(:claro)
    media[4] = @user.registros.average(:movistar)
    media
  end
  def resumen_max
    maximo = Array.new
    maximo[0] = @user.registros.maximum(:llamada)
    maximo[1] = @user.registros.maximum(:ciber)
    maximo[2] = @user.registros.maximum(:impresion)
    maximo[3] = @user.registros.maximum(:claro)
    maximo[4] = @user.registros.maximum(:movistar)
    maximo
  end
  def lista_corta
    salida = []
    (-10..-1).each do |reg|
      salida << @user.registros[reg] if @user.registros[reg]
    end
    salida
  end
  def lista_corta_html
    salida=""
    lista_corta.each do |r|
      salida += sprintf("<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td>",
      r.fecha,r.turno.descripcion,r.llamada,r.ciber,r.impresion,r.claro,r.movistar ) 
    end
    salida
  end
end
