
def reemplazar (string)
    string = string.gsub('{','do\n')  
    string = string.gsub('}','\nend')
    string
 end

puts reemplazar(" { hola } ")
puts reemplazar("{hola}")
puts reemplazar("3.times { |i| puts i }")
puts reemplazar("nada")