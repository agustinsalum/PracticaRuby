
# ROT13 es un sencillo cifrado César utilizado para ocultar un texto
# sustituyendo cada letra por la letra que está trece posiciones por
# delante en el alfabeto

def descodificar(letra,cantidad)
    case letra
    when 'a'..'m', 'A'..'M'
        letra.ord + cantidad
    when 'n'..'z', 'N'..'Z'
        letra.ord + cantidad
    else
        letra.ord
    end.chr
end


def rot13_con_map_cantidad(cadena,cantidad)
    ((cadena.chars).map { |letra|  descodificar(letra,cantidad) }).join
end


  
p rot13_con_map_cantidad('AaZz',3)

