

# Retorna el string con los caracteres en orden inverso.
def string_reverso(cadena)
    nueva_cadena=""
    lista=cadena.split(' ')
    lista.each { |palabra| nueva_cadena= "#{nueva_cadena} #{palabra.reverse}" }
    p nueva_cadena.strip
end

# Elimina los espacios en blanco que contenga.
def string_sin_espacio(cadena)
    p cadena.delete(" ")
    #p cadena.gsub(/\s+/, "")
end

# Retorna un arreglo con cada uno de los caracteres convertidos a su correspondiente valor ASCII.
def string_a_arreglo_ascii(cadena)
    arreglo=[]
    lista=cadena.delete(" ").chars
    lista.each { |letra| arreglo << letra.ord }
    p arreglo
end

# Cambia las vocales por números
def string_remplaza_vocal(cadena)
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
    p arreglo
end

cadena = "RubI es el mejor amigo de un desarollador"
string_reverso(cadena)
string_sin_espacio(cadena)
string_a_arreglo_ascii(cadena)
string_remplaza_vocal(cadena)