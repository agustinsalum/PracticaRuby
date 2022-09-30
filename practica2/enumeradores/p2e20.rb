
class Array

    def randomly()
        if block_given?  # Si nos pasaron un bloque invocar cada elemento de forma aleatoria sin repetir
            (self.length).times { num = self.sample ; yield(num) ; self.delete(num) }
        else # Retornar enumerador que arroja los elementos de forma aleatoria
            un_enumerador = Enumerator.new do |caller|
                p caller
                loop do
                    num = self.sample
                    caller.yield (num)
                    self.delete(num)
                end
            end
        end
        return un_enumerador
    end
end

puts "Con bloque: "
[1,2,3].randomly { |x| p x }

puts "Sin bloque: "
un_enumerador = [1,2,3].randomly()
p un_enumerador.next
p un_enumerador.next
p un_enumerador.next