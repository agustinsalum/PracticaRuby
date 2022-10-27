
# Las variables globales no son una buena opción en este caso.
# Lo que tenés que ver es la ubicación del bloque rescue, si no te conviene ubicarlo dentro del bloque del map.

def sosUnNumero?(palabra)
    ((palabra.scan(/[a-z]/i)).empty?) ? (return palabra.to_i) : (return palabra)  # Expresiones regulares
end

def procesar_archivo(file)
    archivo = File.open(file)
    coleccion_palabras = []
    while linea = archivo.gets            # obtenemos toda la linea con el salto de linea /n
        dato = linea.chomp                # eliminamos el salto de linea /n
        dato = sosUnNumero?(dato)         # El archivo nos retorna todo como string.. lo convertimos a su tipo original
        coleccion_palabras << dato
    end
    contador = 0
    begin
        coleccion_palabras.map do |dato|
            p dato
            yield(dato)
            p dato
            contador+=1
            coleccion_palabras.delete(dato)
        rescue => mensaje
            gets()
            puts "Error encontrado: #{mensaje.message} #{$!.class}"
            p coleccion_palabras
            coleccion_palabras.delete(dato) # Las variables del iterador no tiene alcance
            p coleccion_palabras
            retry
        end
    ensure # Afuera del MAP sino se ejecuta siempre
        puts "Total: #{contador}"
    end
end

procesar_archivo('archivo') { |linea| Integer(linea) }
#procesar_archivo('archivo') { |linea| p 5/linea }