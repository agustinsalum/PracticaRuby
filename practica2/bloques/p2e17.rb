
# RuntimeError: Una clase de error genérica generada cuando se intenta una operación no válida.
# NoMethodError: Se genera cuando se llama a un método en un receptor que no lo tiene definido.
# Descripcion de todos los errores: https://ruby-doc.org/core-3.1.2/Exception.html

def probando_excepciones(*args)
    begin
        total = args.each.inject(0) { |sum,x| yield(sum,x) }
    rescue RuntimeError
        p "Hay algo mal que no anda bien"
        return :rt
    rescue NoMethodError => mensaje_original
        p "Y este método? #{mensaje_original}"
        return :nm
    rescue Exception
        p "Y ahora?"
        raise.Exception
    end
end

# Este funciona bien
p probando_excepciones(1,2,3,4,5) { |sum,x| sum+x }

# Este provoca la excepcion RuntimeError


# Este provoca la excepcion NoMethodError


# Este provoca una excepcion cualquiera
p probando_excepciones("hola","agustin") { |sum,x| sum+x }