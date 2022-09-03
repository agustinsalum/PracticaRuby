
def longitud(lista)
    lista.map { |item| item.length }
end

lista = ['Agustin', 'hola', 'Ruby']
p longitud(lista)