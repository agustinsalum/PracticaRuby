
def sumar_multiplos(arreglo,tope)
    total = 0
    for i in arreglo do
        total+= ((0..tope).to_a.select { |x| x % i  == 0}.inject(:+))
    end
    total
end


p sumar_multiplos([3, 5, 17, 28, 65], 100_000)
p sumar_multiplos([3, 5, 17], 10)

irb(main):023:0> [3, 5, 17, 28, 65].map {|i| 5 % i}
=> [2, 0, 5, 5, 5]
irb(main):024:0> [3, 5, 17, 28, 65].map {|i| 5 % i}
=> true
irb(main):022:0> [true, false].all?
=> false
irb(main):023:0> [3, 5, 17, 28, 65].map {|i| 5 % i}
=> [2, 0, 5, 5, 5]
irb(main):024:0> [3, 5, 17, 28, 65].map {|i| 5 % i}
=> [2, 0, 5, 5, 5]
irb(main):025:0> [true, false].all?
                                         