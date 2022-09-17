
class Usuario
    attr_accessor :nombre_usuario, :rol
    
    def initialize(nombre_usuario, rol)
        self.nombre_usuario = nombre_usuario
        self.rol = rol
    end

    def to_s
        "# => #{nombre_usuario} (#{rol})"
    end

end

un_usuario = Usuario.new('agustin92', 'Lector')
p un_usuario.to_s