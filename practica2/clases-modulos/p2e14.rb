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

#puts A.value     # El valor es obtenido de la constante del modulo A
#puts A::B.value  # El valor es obtenido de la constante de la clase B
#puts C::D.value  # El valor es obtenido de la constante de la clase D 
#puts C::E.value  # El valor es obtenido de la constante global
#puts F.value     # El valor es obtenido de la constante global

puts "Ejercicio 2"

#puts A::value            # Imprime A porque el metodo de instancia del modulo tiene a su alcance su constante
#puts A.new.value         # Tira error porque un modulo no puede tener instancias, ya que no es una clase
#puts B.value             # Tira error porque ¿...?
puts C::D.value           # Imprime D porque es la constante que esta a su alcance
puts C.value              # Imprime global porque no tiene constante local, entonces busca la global
puts F.superclass.value   # Imprime lo mismo que C.value porque C es la superclase