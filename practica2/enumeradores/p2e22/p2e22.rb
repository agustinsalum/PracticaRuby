
require_relative 'esUnStringVacio.rb'
require_relative 'noEsUnaPalabra.rb'
require_relative 'validar.rb'

class Palabra
    def initialize(palabra)
        Validacion.validar(palabra)
        @palabra = palabra
    end

    # que debe retornar las vocales que contiene la palabra que representa, sin repeticiones.
    def vocales
    end

    # que debe retornar las consonantes que contiene la palabra, sin repeticiones.
    def consonantes
    end

    # que debe retornar la cantidad de caracteres que tiene la palabra.
    def longitud
    end
    
    # que debe retornar un valor booleano indicando si la palabra es panvocálica (o pentavocálica), es decir si contiene las 5 vocales.
    def es_panvocalica?
    end

    # que debe retornar un valor boolean indicando si la palabra es un palíndromo, es decir si se lee igual en un sentido que en otro, teniendo al menos 3 letras.
    def es_palindroma?
    end

    # que debe retornar la palabra que representa en mayúsculas.
    def gritando
    end

    # que debe retornar la palabra que representa con las vocales cambiadas por números ( "a" por "4" , "e" por "3" , "i" por "1" , "o" por "0" y "u" por "2" ).
    def en_jaquer
    end
end


una_palabra = Palabra.new("Agustin")