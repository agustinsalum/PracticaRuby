
require_relative 'usuario.rb'

class Documento
    attr_accessor :creador, :contenido, :publico, :borrado
    
    def initialize(usuario, publico = true, contenido = '')
        self.creador = usuario
        self.publico = publico
        self.contenido = contenido
        self.borrado = false
    end

    def perteneceA?(un_usuario)
        self.creador == un_usuario
    end
    
    # A
    def borrar
        self.borrado = true
    end

    # B
    def puede_ser_visto_por?(usuario)
        usuario.puede_ver? self
    end
    
    # C
    def puede_ser_modificado_por?(usuario)
        usuario.puede_modificar? self
    end
    
    # D
    def puede_ser_borrado_por?(usuario)
        usuario.puede_borrar? self
    end
    
end