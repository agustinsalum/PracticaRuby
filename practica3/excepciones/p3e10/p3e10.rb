
dato = 0

def sosUnNumero?(palabra)
    ((palabra.scan(/[a-z]/i)).empty?) ? (return palabra.to_i) : (return palabra)  # Expresiones regulares
end

def procesar_archivo(file)
    archivo = File.open(file)
    coleccion_palabras = []
    while linea = archivo.gets  # obtenemos toda la linea con el salto de linea /n
        dato = linea.chomp   # eliminamos el salto de linea /n
        dato = sosUnNumero?(dato)       # El archivo nos retorna todo como string.. lo convertimos a su tipo original
        coleccion_palabras << dato
    end
    contador = 0
    begin
        coleccion_palabras.map do |dato|
            $dato = dato
            yield(dato)
            p dato
            contador+=1
            coleccion_palabras.delete(dato)
        end
    rescue => mensaje
        puts "Error encontrado: #{mensaje.message} #{$!.class}"
        coleccion_palabras.delete($dato) # Las variables del iterador no tiene alcance
        retry
    ensure
        puts "Total: #{contador}"  # Cuando termina de iterar mostramos el total
    end
end

procesar_archivo('archivo') { |linea| Integer(linea) }
#procesar_archivo('archivo') { |linea| p 5/linea }