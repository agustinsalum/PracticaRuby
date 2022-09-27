
# RuntimeError: Una clase de error genérica generada cuando se intenta una operación no válida.
# NoMethodError: Se genera cuando se llama a un método en un receptor que no lo tiene definido.
# Descripcion de todos los errores en la documentacion oficial: https://ruby-doc.org/core-3.1.2/Exception.html


def probando_excepciones(*args)
    begin
        (args.each.inject(0) { |sum,x| yield(sum,x) })
    rescue RuntimeError
        p "Hay algo mal que no anda bien"
        return :rt
    rescue NoMethodError => mensaje_original # evitamos $!
        p "Y este método? #{mensaje_original}" # '1'/2 --> ERROR
        return :nm
    rescue Exception
        p "Y ahora?" # 1/0 --> DIVISION POR CERO 
        # Volver a lanzar la excepcion
        raise
    end
end

puts ("Este funciona bien: ")
p probando_excepciones(1,2,3) { |sum,x| sum + (x.to_f)/2 } # to_f para tener mayor precision

puts ("Este provoca la excepcion RuntimeError: ")

puts ("Este provoca la excepcion NoMethodError")
p probando_excepciones('1','2','3') { |sum,x| sum + (x/2) }

puts ("Este provoca una excepcion cualquiera: ")
p probando_excepciones(1,2,3) { |sum,x| sum + (x/0) }