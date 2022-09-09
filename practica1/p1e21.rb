
def sumar_tres_cinco(tope)
    (0..tope).to_a.select { |x| x % 3 == 0 && x % 5 == 0 }.inject(:+)
end


p sumar_tres_cinco(100)