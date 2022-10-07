
def reemplazar (string)
    string.gsub!('{','do\n')  # ! modifica el receptor. No es necesario hacer string = string.gsub!
    string.gsub!('}','\nend')
    string
 end

puts reemplazar(" { hola } ")
puts reemplazar("{hola}")
puts reemplazar("3.times { |i| puts i }")
puts reemplazar("nada")