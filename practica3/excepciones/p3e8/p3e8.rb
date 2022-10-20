
=begin
    * Heredar de StandardError y nunca de Exception.
    * Heredar de Exception es malo porque rompe el comportamiento esperado de rescate
    * Estaria rescatando todos los errores a nivel de aplicación, pero el suyo seguirá navegando.
=end

class NoEsUnNumero < StandardError
    attr_reader :thing
    def initialize(msg="My default message", thing="apple")
        @thing = thing
        super(msg)
    end
end