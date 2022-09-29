
class Validacion

    def self.verificar_vacio(palabra)
        raise EsUnStringVacio.new("Es un string vacío") if (palabra == "" || palabra == " ") 
    end

    def self.verificar_palabra(palabra)
        raise NoEsUnaPalabra.new("#{palabra} no es una palabra") if (palabra.include?(" ") && palabra != " ") 
    end
    
    def self.validar(palabra)
        verificar_palabra(palabra)
        verificar_vacio(palabra)
    end
end