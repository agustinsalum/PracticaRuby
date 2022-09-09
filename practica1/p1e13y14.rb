

def listar_mejorada(dic,pegamento=": ")
    dic.each.with_index(1).inject("") {|acc, ((k,v), i)| acc += "#{i} #{pegamento} #{k}: #{v}\n"}
end

def listar(dic)
    # index(1) le decimos desde que numero empieza el indice
    dic.each.with_index(1).inject("") {|acc, ((k,v), i)| acc += "#{i}. #{k}: #{v}\n"}
end


p listar({ perros: 2, gatos: 2, peces: 0, aves: 0 })
p listar_mejorada({ perros: 2, gatos: 2, peces: 0, aves: 0 },"->")