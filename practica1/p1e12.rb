
def longitud_uno(lista)
    lista.map { |item| item.length }
end

# Otra forma de resolverlo
# Explicacion: Teoria "Conceptos avanzados" --> "Bloques más dinámicos"
# Similar a Splat(*) en la invocacion que transforma los arreglos en argumentos formales para un metodo
# En este caso & transforma el argumento a proc(bloque).. ya que los iteradores aceptan bloques (como cualquier funcion) pero no argumentos 
def longitud_dos(lista)
    lista.map(&:length)
end

lista = ['Agustin', 'hola', 'Ruby']
p longitud_uno(lista)
p longitud_dos(lista)