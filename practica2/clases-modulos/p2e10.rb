
module Countable
    module MetodoClase
        # método de clase que al invocarse realiza las tareas necesarias para contabilizar las invocaciones al método de instancia cuyo nombre es sym (un símbolo).
        def count_invocations_of(sym)
            "hola"
        end
    end

    # Cuando un modulo es incluido en una clase se ejecuta este metodo (no es metodo de clase)
    def self.included(base)
        base.extend(MetodoClase)
    end

    # método de instancia que devuelve un valor booleano indicando si el método llamado sym fue invocado al menos una vez en la instancia receptora.
    def invoked?(sym)
    end

    # método de instancia que devuelve la cantidad de veces que el método identificado por sym fue invocado en la instancia receptora.
    def invoked(sym)
    end
end

class Sample

    def hello
       puts "Hello Ruby!"

    end
 end

 Sample.include Countable
 p Sample.count_invocations_of :hello


=begin
 def foo() end

    count = 0
    name = :foo
    
    TracePoint.trace(:call) do |t|
      count += 1 if t.method_id == name
    end
    
    count # => 0
    foo
    count # => 1
    foo
    count # => 2
=end