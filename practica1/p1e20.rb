
# Clase de prueba
class A
    def initialize
        @a=1
        @b=0
    end

    def metodo()
    end
end



puts ('Obtener la lista de ancestros (superclases) de una clase')
p A.class.ancestors

puts ('Conocer la lista de métodos de una clase')
p A.instance_methods()

puts ('Conocer la lista de métodos de instancia de una clase')
p A.instance_methods(false)

puts (' Conocer las variables de instancia de una clase')
a = A.new
p a.instance_variables()

puts ('Obtener el valor de una variable de instancia de un objeto (sin utilizar un método generado con attr_reader o similar) accediendo desde fuera de éste')

a = A.new

a.instance_variables.each { |iv| self.class.send(:attr_reader, iv.to_s[1..-1].to_sym)}

p a.a
p a.b

# Establecer el valor de una variable de instancia de un objeto (sin utilizar un método generado con attr_writer o similar) desde fuera de éste.

aa = A.new

aa.instance_variables.each { |iv| self.class.send(:attr_writer, iv.to_s[1..-1].to_sym)}

aa.a = 4
aa.b = 6
p aa.a
p aa.b