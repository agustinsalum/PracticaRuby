
# ROT13 es un sencillo cifrado César utilizado para ocultar un texto
# sustituyendo cada letra por la letra que está trece posiciones por
# delante en el alfabeto

# Ejemplo con 'A': En to_str reemplaza por el primer from_str (que seria N-Z). 
# Ejemplo con 'Z': Sobrepasa el primer from_str y sigue verificando en el siguiente (A-M)
def rot13(string)
    string.tr("A-Za-z", "N-ZA-Mn-za-m")
end
  
p rot13("¡aZ!")

