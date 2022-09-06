
def listar(dic)
    str=''
    i=0
    dic.each do |key, value|
        i=i+1
        str = str + "#{i}. #{key}: #{value}\n"
    end
    str
end

p listar({ perros: 2, gatos: 2, peces: 0, aves: 0 })