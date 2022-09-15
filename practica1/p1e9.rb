

# Retorna el string con los caracteres en orden inverso.
def string_reverso(cadena)
    ((lista=cadena.split(' ')).inject("") { |acumulador, ((palabra), i)| acumulador += "#{palabra.reverse}"}).strip
end

# Elimina los espacios en blanco que contenga.
def string_sin_espacio(cadena)
    cadena.delete(" ")
    #cadena.gsub(/\s+/, "")
end

# Retorna un arreglo con cada uno de los caracteres convertidos a su correspondiente valor ASCII.
def string_a_arreglo_ascii(cadena)
    (cadena.delete(" ").chars).inject([]) { |acumulador, ((letra), i)| acumulador << "#{letra.ord}"}
end

# Cambia las vocales por números. Con when
def string_remplaza_vocal_hash(cadena)
    arreglo=[]
    lista=cadena.delete(" ").chars
    lista.each do 
        |letra|
        case letra
        when 'a','A' then arreglo << 4
        when 'e','E' then arreglo << 3
        when 'i','I' then arreglo << 1
        when 'o','O' then arreglo << 0
        when 'u','U' then arreglo << 6 
        else 
            arreglo << letra
        end 
    end
     arreglo
end

cadena = "RubI es el mejor amigo de un desarollador"
p string_reverso(cadena)
p string_sin_espacio(cadena)
p string_a_arreglo_ascii(cadena)
p string_remplaza_vocal_hash(cadena)