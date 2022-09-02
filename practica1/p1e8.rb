
# La manera de incluir case‐insensitive (sin distinguir mayúsculas o minúsculas) usamos downcase
# Se cumple si el segundo string esta en la palabra completa
# ¿str1.casecmp(str2).zero?

def contar(frase,palabra)
    lista=frase.split(' ')
    (lista.select { |palabra_de_frase| palabra_de_frase.downcase == palabra.downcase }).length
end

puts contar("La casa de la esquina tiene la puerta roja y la ventana blanca.", "la") 
puts contar("Ruby es el mejor amigo DE un dEsarollador", "de") 
puts contar("Ruby es un lenguaje de programacion DINAMICO y de código abierto", "na") 
puts contar("Ruby Tiene dos tIpos de comentarios: en linea y en bloque.", "TI") 
puts contar("aAAABc", "a") 
