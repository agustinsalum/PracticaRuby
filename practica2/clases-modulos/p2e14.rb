VALUE = 'global'

module A
    VALUE = 'A' 
    
    class B
        VALUE = 'B'
        
        def self.value; p "Debug1"; VALUE end # B
        
        def value; 'iB' end 
    
    end
    
    def self.value; p "Debug2"; VALUE end # A

end

class C
    class D
        VALUE = 'D'
        
        def self.value; p "Debug3"; VALUE end # D
    end

    module E
        def self.value; p "Debug4"; VALUE end # global
    end
    
    def self.value; p "Debug5"; VALUE end # global
end

class F < C
    VALUE = 'F' 
end

puts "Ejercicio 1"

#puts A.value     # A puede ser un modulo o una clase. Imprime A
#puts A::B.value  # 'A::' sabemos que A es un modulo. B podria ser un modulo o una clase, imprime B
#puts C::D.value  # imprime D
#puts C::E.value  # E no tiene value, imprime la global
#puts F.value      # Va al metodo de C, imprime la global 

puts "Ejercicio 2"

#puts A::value             # Sabemos que A es un modulo 
#puts A.new.value          # Tira error porque los modulos no pueden crear instancias
#puts B.value              # Para que no tire error debemos hacer 'A::B.value'
#puts C::D.value           # Para acceder a value de D, debemos antes hacer 'A::'
#puts C.value              # Accede a su metodo de clase
#puts F.superclass.value   # C.value