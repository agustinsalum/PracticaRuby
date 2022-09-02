
def reemplazar (string)
    string['{'] = 'do\n'  if string.include?('{')
    string['}'] = '\nend' if string.include?('}')
    string
 end

puts reemplazar(" { hola } ")
puts reemplazar("{hola}")
puts reemplazar("3.times { |i| puts i }")
puts reemplazar("nada")