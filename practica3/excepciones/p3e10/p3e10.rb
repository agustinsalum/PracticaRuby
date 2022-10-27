
# Las variables globales no son una buena opción en este caso.
# Lo que tenés que ver es la ubicación del bloque rescue, si no te conviene ubicarlo dentro del bloque del map.

def sosUnNumero?(palabra)
    if (palabra != "") # Si nos mandan una linea vacia
        ((palabra.scan(/[a-z]/i)).empty?) ? (return palabra.to_i) : (return palabra)  # Expresiones regulares
    else
        ""
    end
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
        # No hacerlo con MAP e ir eliminando los elementos. El MAP retorna una nueva estructura y trabaja con ella
        # Provocaria que dato siempre quede con el dato eliminado
        coleccion_palabras.each do |dato|
            yield(dato)
            p dato
            contador+=1
        rescue => mensaje
            puts "Error encontrado: #{mensaje.message} #{$!.class}"
        end
    ensure # Si lo declaramos adentro del iterador se va a ejecutar mas de una vez
        return contador # Retornamos la cantidad
    end
end

puts "Procesamos el ejemplo de la catedra: "
puts (procesar_archivo('archivo') { |linea| Integer(linea) })
puts ""
puts "Procesamos otro ejemplo:"
puts (procesar_archivo('archivo') { |linea| 5/linea })