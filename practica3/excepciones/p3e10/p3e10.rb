
def sosUnNumero?(palabra)
    ((palabra.scan(/[a-z]/i)).empty?) ? (return palabra.to_i) : (return palabra)  # Expresiones regulares
end

def procesar_archivo(file)
    archivo = File.open(file)
    coleccion_palabras = []
    while linea = archivo.gets  # obtenemos toda la linea con el salto de linea /n
        dato = linea.chomp   # eliminamos el salto de linea /n
        dato = sosUnNumero?(dato)       # Solucion a que todo nos retorna como string
        coleccion_palabras << dato
    end
    p coleccion_palabras
    contador = 0
    begin
        p "empieza"
        coleccion_palabras.map do |dato|
            yield(dato)
            puts dato
            contador+=1
            coleccion_palabras.delete(dato)
            p coleccion_palabras
        end
    rescue ArgumentError => mensaje
        puts "Error encontrado: #{mensaje}"
        gets()
        coleccion_palabras.delete(dato)
        p dato
        p coleccion_palabras
        retry
        
    end
end





procesar_archivo('archivo') { |linea| Integer(linea) }