
# Consultar
def multiplos_de(arreglo,tope)
    # Seleccionamos los numeros del rango que son multiplos de todos los numeros del arreglo
    # Select recorre los numeros del rango
    # Map recorre todos los numeros del arreglo
    # numero_rango % num == 0 --> Si numero de rango es multiplo de num retorna true para esa posicion
    # all? retorna True si todas las posiciones dieron True
    # Si todas las posiciones dieron true el select guarda ese numero de rango que fue multiplo de todos
    # Por ultimo, una vez obtenidos todos los numeros que cumplen, hacemos la sumatoria con inject 
    ((0..tope).select { |numero_rango| (arreglo.map { |num| numero_rango % num == 0}).all?}).inject(:+)
end

p multiplos_de([3, 5], 100)
p multiplos_de([3, 5, 17, 28, 65], 100_000)

=begin
Ayuda:
irb(main):023:0> [3, 5, 17, 28, 65].map {|i| 5 % i}
=> [2, 0, 5, 5, 5]
irb(main):022:0> [true, false].all?
=> false
=end
