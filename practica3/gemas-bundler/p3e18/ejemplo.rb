
# https://guides.rubygems.org/make-your-own-gem/#your-first-gem

require 'cantidadInvocaciones'

class MiClase
    include CantidadInvocaciones::Countable

    def hola
        puts "Hola"
    end

    def chau
        puts "Chau"
    end
    
    count_invocations_of :hola

end

class String
    include CantidadInvocaciones::Countable
    count_invocations_of :length
end

a = MiClase.new
a.hola
a.hola
p a.contabilizar       # 2
p a.invoked? :Hola  #true
p a.invoked :hola   # 2


b = "hola"
p b.contabilizar       # {} --> 0
b.length
b.length
p b.contabilizar       # 2