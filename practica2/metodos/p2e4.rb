
def longitud(*arr)
    arr.each { |parametro| p "#{parametro.to_s} --> #{(parametro.to_s).length}"}
end

longitud(9, Time.now, 'Hola', {un: 'hash'}, :ruby)