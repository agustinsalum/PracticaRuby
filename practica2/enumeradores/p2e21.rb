
require 'prime'

numeros_primos = Enumerator.new do |caller|
    actual, limite = 1, 0
    loop do
        caller.yield (Prime.first(actual)).last
        actual=actual+1
        limite+=1
    end
end


p numeros_primos.next
p numeros_primos.next
p numeros_primos.next
p numeros_primos.next