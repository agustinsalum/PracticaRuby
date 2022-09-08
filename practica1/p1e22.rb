
def sumar_multiplos(arreglo,tope)
    total = 0
    for i in arreglo do
        total+= ((0..tope).to_a.select { |x| x % i  == 0}.inject(:+))
    end
    total
end


p sumar_multiplos([3, 5, 17, 28, 65], 100_000)
p sumar_multiplos([3, 5, 17], 10)