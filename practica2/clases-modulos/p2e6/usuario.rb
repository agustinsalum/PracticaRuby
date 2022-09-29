
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
        (rol.class == RolAdministrador) ? un_documento.borrar : "No tenes permisos para borrar"
    end

    # B
    def puede_ver?(documento)
        if (documento.publico) then
            # Los permisos son exigentes en cuanto al tipo de documento
            rol.ver_documento_publico ? documento.contenido : "No tenes permisos para ver"
        else
            rol.ver_documento_privado ? documento.contenido : "No tenes permisos para ver"
        end
    end

    # C
    def puede_modificar?(documento)
        # Redactor puede modificar solo los que creo y el director/administrador cualquiera
        ((rol.class == RolAdministrador) || (rol.class == RolDirector) && !(documento.borrado)) || ((rol.class == RolRedactor) && (documento.creador == self)) ? true : false
    end

    # D
    def puede_borrar?(un_documento)
        (rol.class == RolAdministrador) ? true : false
    end

end