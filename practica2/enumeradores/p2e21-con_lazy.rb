
# Lazy soporta rangos infinitos porque no carga todo en memoria, a diferencia del enumerator comun
# enumerator a partir de una colección.
def primos_lazy(tope)
        ((2..Float::INFINITY).lazy.reject { |numero| (2...numero).any? { |num| numero % num == 0 } }).take(tope)
end

begin # La excepcion se captura afuera y no adentro de la funcion porque se lanza en el momento que se hace next
    enumerador_lazy_m = primos_lazy(4)
    p enumerador_lazy_m.next
    p enumerador_lazy_m.next
    p enumerador_lazy_m.next
    p enumerador_lazy_m.next
    p enumerador_lazy_m.next
rescue StopIteration
    puts "Llegaste al corte"
end