
def longitud_uno(lista)
    lista.map { |item| item.length }
end

# Otra forma de resolverlo
# Cada vez que Ruby ve un & como parametro, quiere que sea un Proc.
# Si este no es el caso, Ruby llama #to_proca para convertirlo
def longitud_dos(lista)
    lista.map(&:length)
end

lista = ['Agustin', 'hola', 'Ruby']
p longitud_uno(lista)
p longitud_dos(lista)