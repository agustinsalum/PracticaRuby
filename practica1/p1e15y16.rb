
# ROT13 es un sencillo cifrado César utilizado para ocultar un texto
# sustituyendo cada letra por la letra que está trece posiciones por
# delante en el alfabeto

def rot13(string)
    string.tr("A-Za-z", "N-ZA-Mn-za-m")
end

def rot13_con_cantidad(cadena,cantidad)
    nueva_cadena=cadena.split("")
    (nueva_cadena.map { |c| (c.ord + cantidad).chr if c.match?(/[a-zA-Z0-9&_\.-]/)}).join('')
end
  
p rot13("¡abcd!")
p rot13_con_cantidad("¡abcd!",13)

