
# ROT13 es un sencillo cifrado César utilizado para ocultar un texto
# sustituyendo cada letra por la letra que está trece posiciones por
# delante en el alfabeto

def rot13(string)
    string.tr("A-Za-z", "N-ZA-Mn-za-m")
end
  
p rot13("¡abcd!")

