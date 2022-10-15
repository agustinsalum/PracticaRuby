
def verificar(palabra)
    p palabra.scan(/[a-z]/i)
end

def procesar_archivo(file)
    archivo = File.open(file)
    coleccion_palabras = []
    while linea = archivo.gets # obtenemos toda la linea con el salto de linea /n
        palabra = linea.chomp # eliminamos el salto de linea /n
        verificar(palabra)
        coleccion_palabras << palabra
    end
    p coleccion_palabras
    contador = 0
    begin
        coleccion_palabras.map do |palabra|


        end
    rescue
        "nada"
    end
end





procesar_archivo('archivo') { |linea| Integer(linea) }