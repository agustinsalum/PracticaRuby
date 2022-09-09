

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

# Cambia las vocales por números. Con diccionario
def string_remplaza_vocal_dicc(cadena)
    diccionario = {'a'=> 4,'A'=> 4,'e'=> 3,'E'=> 4,'i'=> 1,'I'=> 1,'o'=> 0,'O'=> 0,'u'=> 6,'U'=> 6}
    (cadena.delete(" ").chars).inject([]) do 
        |acumulador, ((letra), i) | 
        if (diccionario[letra]).nil?
            acumulador << letra
        else
            acumulador << diccionario[letra]
        end
    end
end

cadena = "RubI es el mejor amigo de un desarollador"
p string_reverso(cadena)
p string_sin_espacio(cadena)
p string_a_arreglo_ascii(cadena)
p string_remplaza_vocal_hash(cadena)
p string_remplaza_vocal_dicc(cadena)