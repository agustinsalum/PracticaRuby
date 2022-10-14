# Este script lee una secuencia de no menos de 15 números desde teclado y luego imprime el resultado de la división
# de cada número por su entero inmediato anterior.
# Como primer paso se pide al usuario que indique la cantidad de números que ingresará.
begin
    puts "Aca empieza la excepcion para errores globales"
    begin
        puts "Aca empieza la excepcion para errores de argumentos (cantidad)"
        cantidad = 0
        while cantidad < 15
            puts 'Cuál es la cantidad de números que ingresará? Debe ser al menos 15'
            cantidad = Integer(gets)
        end
    rescue ArgumentError  # Por si ingresa letras en vez de numeros
        puts "Por favor.. debe ingresar numeros. Se le solicitara nuevamente una cantidad"
        gets()
        retry
    end
    begin
        puts "Aca empieza la excepcion para errores de division por cero"
        begin
            puts "Aca empieza la excepcion para errores de argumentos (numeros)"
            # Luego se almacenan los números
            numeros = 1.upto(cantidad).map do
                puts 'Ingrese un número'
                numero = Integer(gets)
            end
        rescue ArgumentError  # Por si ingresa letras en vez de numeros
            puts  "Por favor.. debe ingresar numeros. Se le solicitara nuevamente numeros"
            gets()
            retry
        end
        # Y finalmente se imprime cada número dividido por su número entero inmediato anterior
        resultado = numeros.map { |x| x / (x - 1) }
        puts 'El resultado es: %s' % resultado.join(', ')
    rescue ZeroDivisionError # Por si ingreso un 1
        puts  "Parece que ingreso un 1, lo cual provoca una division por cero. Vuelva a ingresar numeros"
        gets()
        retry
    end
rescue Excepcion # El padre de todas las excepciones
    puts  "Ocurrio un error inesperado.. Se retornara la ejecucion al principio"
    gets()
    retry
end
