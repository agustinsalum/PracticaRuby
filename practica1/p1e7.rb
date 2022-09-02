
# Falta incluir case‐insensitive (sin distinguir mayúsculas o minúsculas)
# str1.casecmp(str2).zero? para el siguiente ejercicio

def contar(frase,palabra)
    lista=frase.split(' ')
    (lista.select { |palabra_de_frase| palabra_de_frase.casecmp?(palabra) }).length
end

puts contar("La casa de la esquina tiene la puerta roja y la ventana blanca.", "la")