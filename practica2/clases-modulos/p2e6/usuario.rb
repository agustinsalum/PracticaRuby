
require_relative 'documento.rb'

class Usuario
    attr_accessor :nombre_usuario, :rol
    
    def initialize(nombre_usuario, rol)
        @nombre_usuario = nombre_usuario
        @rol = rol
    end

    def crear_documento(tipo,descripcion)
        Documento.new(self,tipo,descripcion)
    end

    # A
    def borrar(un_documento)
        (rol.sos_administrador?) ? un_documento.borrar : "No tenes permisos para borrar"
    end

    # B
    def puede_ver?(documento)
        if (documento.publico) then
            rol.ver_documento_publico ? documento.contenido : "No tenes permisos para ver"
        else
            rol.ver_documento_privado ? documento.contenido : "No tenes permisos para ver"
        end
    end

    # C
    def puede_modificar?(documento)
        # Redactor puede modificar solo los que creo y el director/administrador cualquiera
        ((rol.sos_administrador?) || (rol.sos_director?) && !(documento.borrado)) || ((rol.sos_redactor?) && (documento.creador == self)) ? true : false
    end

    # D
    def puede_borrar?(un_documento)
        (rol.sos_administrador?) ? true : false
    end

end