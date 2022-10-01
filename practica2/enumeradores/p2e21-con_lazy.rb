
# returns lazy enumerator
def primos_lazy_simple(tope)
    # reject es lo contrario a select
    # Math.sqrt() devuelve la raíz cuadrada
    # El 2 y 3 dan false en any? y el reject los retorna
    # A partir del 4 hacia adelante entran al % j = 0, donde j es el valor del rango 
    # Evalua con los valores del rango (por lo general solo 2) y corta hasta el true
    # Es decir, si un numero es divisible corta y retorna true.. el reject no lo retorna (salvo que sea un select)
    (2..Float::INFINITY).lazy.reject { |numero| (2..Math.sqrt(numero)).any?{ |j| numero % j == 0 } }.take(tope)
end

def primos_lazy_alternativo(tope)
    Enumerator.new do |e|
        e.yield 2
        (3..Float::INFINITY).step(2).lazy.reject{ |i| (3..Math.sqrt(i)).step(2).any?{ |j| i % j == 0 } }.map(&:to_i).each(&e.method(:yield).to_proc)
    end.lazy
end

def primos_lazy_casero(tope)
    Enumerator.new do |a|
        e.yield 2
        (3..Float::INFINITY).step(2).lazy.reject{ |i| (3..Math.sqrt(i)).step(2).any?{ |j| i % j == 0 } }.map(&:to_i).each(&e.method(:yield).to_proc)
    end.lazy
end

enumerador_lazy = primos_lazy_simple(4)
p enumerador_lazy.next
p enumerador_lazy.next
p enumerador_lazy.next
p enumerador_lazy.next
p enumerador_lazy.next
p enumerador_lazy.next

enumerador_lazy_smarte = primos_lazy_alternativo(5)