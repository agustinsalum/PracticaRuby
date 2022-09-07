
# ROT13 es un sencillo cifrado César utilizado para ocultar un texto
# sustituyendo cada letra por la letra que está trece posiciones por
# delante en el alfabeto

def rot13_con_cantidad(string, cantidad)
    string.tr("A-Z-a-z","#{(('A').ord+cantidad).chr}-#{(('Z').ord+cantidad).chr}-#{(('a').ord+cantidad).chr}-#{(('z').ord+cantidad).chr}")
end


  
p rot13_con_cantidad('¡Agustin!',3)
p rot13_con_cantidad('zZ',2)

