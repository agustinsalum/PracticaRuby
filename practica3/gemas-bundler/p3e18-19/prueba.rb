

# https://guides.rubygems.org/make-your-own-gem/#your-first-gem

require 'cantidad_invocaciones'

# Clase propia creada
class Greeter
    include CantidadInvocaciones::Countable # Incluyo el Mixin. Nuestras instancias conocen los metodos de instancia
    
    def saludar; puts 'Hola!' end
    
    def despedirse; puts 'Hasta luego' end
    
   # Entran a count_invocations_of
    count_invocations_of :saludar
    count_invocations_of :despedirse
end

# Redefiniendo la clase String.. debemos incluir y usar count_invocations
class String
    include CantidadInvocaciones::Countable
    count_invocations_of :length
end

a = Greeter.new
a.saludar
a.saludar
p a.contabilizar       # 2
p a.invoked? :saludar  #true
p a.invoked :saludar   # 2


b = "hola"
p b.contabilizar       # {} --> 0
b.length
b.length
p b.contabilizar       # 2
