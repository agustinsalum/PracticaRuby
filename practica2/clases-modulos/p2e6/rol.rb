
class Rol
    attr_reader :nombre, :ver_documento_publico, :ver_documento_privado

    def initialize(nombre)
        @nombre = nombre
    end

    def sos_administrador?
        nombre == 'Administrador'
    end

    def sos_director?
        nombre == 'Director'
    end

    def sos_redactor?
        nombre == 'Redactor'
    end

end


class RolLector < Rol
    def initialize()
        @ver_documento_publico = true
        @ver_documento_privado = false
        @modificar_documento_crearon = false
        @modificar_documento_excepto_borrado = false
        @borrar_documento = false
        super('Lector')
    end
end

class RolRedactor < Rol
    def initialize()
        @ver_documento_publico = true
        @ver_documento_privado = false
        @modificar_documento_crearon = true
        @modificar_documento_excepto_borrado = false
        @borrar_documento = false
        super('Redactor')
    end
end

class RolDirector < Rol
    def initialize()
        @ver_documento_publico = true
        @ver_documento_privado = true
        @modificar_documento_crearon = false
        @modificar_documento_excepto_borrado = true
        @borrar_documento = false
        super('Director')
    end
end

class RolAdministrador < Rol
    def initialize()
        @ver_documento_publico = true
        @ver_documento_privado = true
        @modificar_documento_crearon = false
        @modificar_documento_excepto_borrado = true
        @borrar_documento = true
        super('Administrador')
    end
end