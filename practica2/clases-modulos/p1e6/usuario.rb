
require_relative 'documento.rb'

# Lectores      --> ver documentos publicos ;
# Redactores    --> ver documentos publicos ; modificar documentos que crearon
# Directores    --> ver documentos publicos y privados ; modificar cualquier documento excepto borrados  
# Administrador --> ver documentos publicos y privados ; modificar cualquier documento excepto borrados ; borrar documentos

class Usuario
    attr_accessor :nombre_usuario, :rol
    
    def initialize(nombre_usuario, rol)
        self.nombre_usuario = nombre_usuario
        self.rol = rol
    end

    def crear_documento(tipo,descripcion)
        un_documento = Documento.new(self,tipo,descripcion)
    end

    def borrar(un_documento)
        un_documento.borrar if rol == 'Administrador'
    end

    def soyLector()
        self.rol == 'Lector'
    end

    def soyRedactor()
        self.rol == 'Redactor'
    end

    def soyDirector()
        self.rol == 'Director'
    end

    def soyAdministrador()
        self.rol == 'Administrador'
    end

    def puede_ver?(un_documento)
        permiso = true
        case permiso
        when self.soyLector   && un_documento.publico then permiso = true
        when self.soyRedactor && un_documento.publico then permiso = true
        when self.soyDirector                         then permiso = true
        when self.soyAdministrador                    then permiso = true
        else
            permiso = false
        end
        permiso
    end

    def puede_modificar?(un_documento)
        permiso = true
        case permiso
        when self.soyRedactor && un_documento.perteneceA?(self)   then permiso = true
        when self.soyDirector && (not(un_documento.borrado))       then permiso = true
        when self.soyAdministrador && (not(un_documento.borrado)) then permiso = true
        else
            permiso = false
        end
        permiso
    end

    def puede_borrar?(un_documento) 
        permiso = true
        case permiso
        when self.soyAdministrador then permiso = true
        else
            permiso = false
        end
        permiso
    end

end