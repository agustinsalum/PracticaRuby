a={}

module Countable
    module CountableMethodClass
        # método de clase que al invocarse realiza las tareas necesarias para contabilizar las invocaciones al método de instancia cuyo nombre es sym (un símbolo).
        def count_invocations_of(sym)
            alias_method "#{sym.downcase}_sym", sym
        end
    end

    # Cuando un modulo es incluido en una clase se ejecuta este metodo (no es metodo de clase)
    def self.included(base)
        base.extend(CountableMethodClass)
    end

    # método de instancia que devuelve un valor booleano indicando si el método llamado sym fue invocado al menos una vez en la instancia receptora.
    def invoked?(sym)
        "hola2"
    end

    # método de instancia que devuelve la cantidad de veces que el método identificado por sym fue invocado en la instancia receptora.
    def invoked(sym)
        "hola3"
    end
end

class Greeter
    include Countable # Incluyo el Mixin
    
    def hi; puts 'Hey!' end
    
    def bye; puts 'See you!' end
    
   
    count_invocations_of :hi
end

 # Indico que quiero llevar la cuenta de veces que se invoca el método #hi
p Greeter.count_invocations_of :hi