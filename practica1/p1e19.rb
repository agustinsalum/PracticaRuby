
# RGB es la composición del color en términos de la intensidad de los colores primarios de la luz.
# (255,0,0) --> Rojo
# (0,255,0) --> Verde
# (0,0,255) --> Azul



def notacion_entera(l_rgb_entera)
    l_rgb_entera[0] + l_rgb_entera[1] * 256 + l_rgb_entera[2] * 256 ** 2
end

# p 10.to_s(16) #=> "a"
# p "%x" % 10 #=> "a"
# p "%02X" % 10 #=> "0A"
# p sprintf("%02X", 10) #=> "0A"
# p "#%02X%02X%02X" % [255, 0, 10] #=> "#FF000A"

def notacion_hexadecimal(l_rgb_hexa) # %02x lo pasa a hexadecimal de 2 digitos
    ("#%02X%02X%02X" % [l_rgb_hexa[0], l_rgb_hexa[1], l_rgb_hexa[2]]).to_s
end


l_rgb_entera = [0, 128, 255]
l_rgb_hexa   = [0, 128, 255]

p notacion_entera(l_rgb_entera)
p notacion_hexadecimal(l_rgb_hexa)