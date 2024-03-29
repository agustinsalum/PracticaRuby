=begin
¿Qué resultado se obtiene en cada caso?
--> Opcion 1: Retorna 0
--> Opcion 2 y 3: Imprime c que tiene 0 y retorna nil 2
--> Opcion 4: Imprime el arreglo c y retorna nil

¿Porqué? 
--> Opcion 1: Porque al provocarse TypeError va directamente al rescue, retornarno 0 sin imprimirlo
--> Opcion 2 y 3: Se provoca el TypeError, va al rescue sin efecto y por ultimo ejecuta el inspect. c es 0 y puts retorna nil (a diferencia de p que retorna el objeto)
--> Opcion 4: En este caso se provoca la excepcion pero almacena el 0. Muestra el arreglo c completo y puts retorna nil (a diferencia de p que retorna el objeto) 
=end

def opcion_1
    a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
    b = 3
    c = a.map do |x|
        x * b
    end
    puts c.inspect
rescue
    0
end

# c tiene 0 por lo que retorna el rescue
def opcion_2
    c = begin
        a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
        b = 3
        c = a.map do |x|
            x * b
        end
    rescue
        0
    end
    puts " c: #{c.inspect}" 
end

# No es necesario el begin
def opcion_3
    a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
    b = 3
    c = a.map { |x| x * b } rescue 0
    puts " c: #{c.inspect}"
end


# No es necesario el begin
# el rescue retorna 0 y lo guarda en las posiciones que levantaron la excepcion
def opcion_4
    a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
    b = 3
    c = a.map { |x| x * b rescue 0 }
    puts "c: #{c.inspect}"
end

puts "Mostramos opcion 1: "
p opcion_1()
puts "Mostramos opcion 2: "
p opcion_2()
puts "Mostramos opcion 3: "
p opcion_3()
puts "Mostramos opcion 4: "
p opcion_4()

