# Este script lee una secuencia de no menos de 15 números desde teclado y luego imprime el resultado de la división
# de cada número por su entero inmediato anterior.
# Como primer paso se pide al usuario que indique la cantidad de números que ingresará.

require_relative "p3e8"

begin
    begin
        puts "Aca empieza la excepcion para errores globales"
        cantidad = 0
        fallo = false
        while cantidad < 15
            puts 'Cuál es la cantidad de números que ingresará? Debe ser al menos 15'
            begin
                cantidad = Integer(gets)
            rescue ArgumentError
                fallo = true
                raise NoEsUnNumero.new("La cantidad no es un valor numérico entero válido")
            ensure
                redo if (fallo)
            end
        end
        puts "Aca empieza la excepcion para errores de division por cero"
        
        begin
            begin
                # Luego se almacenan los números
                numeros = 1.upto(cantidad).map do
                    puts 'Ingrese un número'
                    numero = Integer(gets)
                end
            rescue ArgumentError
                raise NoEsUnNumero.new()
            end

            # Y finalmente se imprime cada número dividido por su número entero inmediato anterior
            resultado = numeros.map { |x| x / (x - 1) }
            puts 'El resultado es: %s' % resultado.join(', ')
        rescue ZeroDivisionError # Por si ingreso un 1
            puts  "Parece que ingreso un 1, lo cual provoca una division por cero. Vuelva a ingresar numeros"
            gets()
            retry
        end
    end
rescue Exception => error # El padre de todas las excepciones
    puts  "Ocurrio: #{error}"
    gets()
    retry
end
