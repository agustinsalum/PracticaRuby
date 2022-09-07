

def listar_mejorada(dic,pegamento=": ")
    str=''
    i=0
    dic.each.each_with_index do |key, value, index|
        i=i+1
        str = str + "#{i}. #{key}#{pegamento} #{value}\n"
    end
    str
end

def listar(dic)
    str=''
    i=0
    dic.each.each_with_index do |key, value, index|
        str = str + "#{index}. #{key}: #{value}\n"
    end
    str
end


p listar({ perros: 2, gatos: 2, peces: 0, aves: 0 })
p listar_mejorada({ perros: 2, gatos: 2, peces: 0, aves: 0 },"->")