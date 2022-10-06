
require_relative 'esUnStringVacio.rb'
require_relative 'noEsUnaPalabra.rb'
require_relative 'validar.rb'

class Palabra
    attr_reader :palabra
    def initialize(palabra)
        Validacion.validar(palabra)
        @palabra = palabra
    end


    # que debe retornar las vocales que contiene la palabra que representa, sin repeticiones.
    # [ "a", "a", "b", "b", "c" ].uniq => ["a", "b", "c"]
    def vocales
        (@palabra.scan(/[aeiou]/i)).uniq
    end

    # que debe retornar las consonantes que contiene la palabra, sin repeticiones.
    def consonantes
        (@palabra.scan(/[bcdfghjklmñpqrstvwyz]/i)).uniq
    end

    # que debe retornar la cantidad de caracteres que tiene la palabra.
    # Si no pertenecia al ejercicio podria haber sido un metodo privado
    def longitud
        @palabra.length
    end
    
    # que debe retornar un valor booleano indicando si la palabra es panvocálica (o pentavocálica), es decir si contiene las 5 vocales.
    def es_panvocalica?
        arreglo_vocales = (@palabra.scan(/[aeiou]/i))
        # minuscula == mayuscula
        p arreglo_vocales
        arreglo_vocales.each { |vocal| vocal.upcase! }
        p arreglo_vocales
        # Si tiene las 5 vocales (o mas por mauyusculas) y no se repiten (definicion de panvocalica)
        (arreglo_vocales.length >= 5) && (arreglo_vocales.all?{ |vocal| arreglo_vocales.count(vocal) == 1 })
    end

    # que debe retornar un valor boolean indicando si la palabra es un palíndromo, es decir si se lee igual en un sentido que en otro, teniendo al menos 3 letras.
    def es_palindroma?
        # capicua
        (@palabra.length >= 3) && (@palabra == @palabra.reverse)
    end

    # que debe retornar la palabra que representa en mayúsculas.
    def gritando
        @palabra.upcase
    end

    # que debe retornar la palabra que representa con las vocales cambiadas por números ( "a" por "4" , "e" por "3" , "i" por "1" , "o" por "0" y "u" por "2" ).
    def en_jaquer
        arreglo_nuevo=[]
        arreglo_recorrer=@palabra.split(//)
        arreglo_recorrer.each do 
            |letra|
            case letra
            when 'a','A' then arreglo_nuevo << 4
            when 'e','E' then arreglo_nuevo << 3
            when 'i','I' then arreglo_nuevo << 1
            when 'o','O' then arreglo_nuevo << 0
            when 'u','U' then arreglo_nuevo << 2 
            else 
                arreglo_nuevo << letra
            end 
        end
        return arreglo_nuevo
    end
end


agustin          = Palabra.new("Agustin")
elenguajee       = Palabra.new("ElenguajeE")
ruby             = Palabra.new("Ruby")
descontinuar     = Palabra.new("descontinuar")
descontinuara    = Palabra.new("descontinuara")
descontinuarae   = Palabra.new("dEscontinuarae")
reconocer        = Palabra.new("reconocer")
ab               = Palabra.new("ab")
