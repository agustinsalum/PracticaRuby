
# Ejercicio realizado en clase

def sumar_tres_cinco(tope)
    ((0..tope).filter { |i| i.modulo(3).zero? && i.modulo(5).zero?  }).sum
end


p sumar_tres_cinco(100)