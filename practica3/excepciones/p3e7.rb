# Este script lee una secuencia de no menos de 15 números desde teclado y luego imprime el resultado de la división
# de cada número por su entero inmediato anterior.
# Como primer paso se pide al usuario que indique la cantidad de nú meros que ingresará.

cantidad = 0
while cantidad < 15
    puts 'Cuál es la cantidad de números que ingresará? Debe ser al menos 15'
    cantidad = Integer(gets)
end

# Luego se almacenan los números
numeros = 1.upto(cantidad).map do
    puts 'Ingrese un número'
    numero = Integer(gets)
end

# Y finalmente se imprime cada número dividido por su número entero inmediato anterior
resultado = numeros.map { |x| x / (x - 1) }
puts 'El resultado es: %s' % resultado.join(', ')