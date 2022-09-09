
# Ejercicio realizado en clase

def notacion_hexadecimal(arreglo)
    arreglo.inject("#") { |acc,i| acc += format("%02x",i)}

end

def notacion_entera(arreglo)
    (arreglo.map.with_index { |elem,i| elem * 255.pow(i)}).sum
end



l_rgb_entera = [0, 128, 255]
l_rgb_hexa   = [0, 128, 255]

p notacion_entera(l_rgb_entera)
p notacion_hexadecimal(l_rgb_hexa)