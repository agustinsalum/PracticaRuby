
#https://ruby-doc.org/stdlib-3.1.2/libdoc/time/rdoc/Time.html


def articulo_correcto(numero)
    if (numero == 1) then
        return 'la'
    else
        return 'las'
    end
end

def tiempo_en_palabras(tiempo)
    mensaje = case tiempo.min
    when 0..10   then " Son #{articulo_correcto(tiempo.hour)} #{tiempo.hour} en punto" 
    when 11..20  then " Son #{articulo_correcto(tiempo.hour)} #{tiempo.hour} y cuarto" 
    when 21..34  then " Son #{articulo_correcto(tiempo.hour)} #{tiempo.hour} y media"  
    when 35..44  then " Son #{articulo_correcto(tiempo.hour+1)} #{tiempo.hour+1} menos veinticinco"
    when 45..55  then " Son #{articulo_correcto(tiempo.hour+1)} #{tiempo.hour+1} Menos cuarto"
    when 56..59  then " Casi son #{articulo_correcto(tiempo.hour+1)} #{tiempo.hour+1}"
    else 
        " Error al ingresar (#{tiempo.min})"
    end
    mensaje
end


puts tiempo_en_palabras(Time.new(2022, 10, 21, 10, 1))
puts tiempo_en_palabras(Time.new(2022, 10, 21, 10, 18))
puts tiempo_en_palabras(Time.new(2022, 10, 21, 9, 33))
puts tiempo_en_palabras(Time.new(2022, 10, 21, 4, 36))
puts tiempo_en_palabras(Time.new(2022, 10, 21, 8, 45))
puts tiempo_en_palabras(Time.new(2022, 10, 21, 6, 58))
puts tiempo_en_palabras(Time.new(2022, 10, 21, 0, 58))

puts ""
puts "Probamos con 1"
puts ""

puts tiempo_en_palabras(Time.new(2022, 10, 21, 1, 1))
puts tiempo_en_palabras(Time.new(2022, 10, 21, 1, 18))
puts tiempo_en_palabras(Time.new(2022, 10, 21, 1, 33))
puts tiempo_en_palabras(Time.new(2022, 10, 21, 1, 36))
puts tiempo_en_palabras(Time.new(2022, 10, 21, 0, 36))
puts tiempo_en_palabras(Time.new(2022, 10, 21, 1, 45))
puts tiempo_en_palabras(Time.new(2022, 10, 21, 1, 58))