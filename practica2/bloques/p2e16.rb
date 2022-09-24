
def procesar_hash(dic, procc)
    dic.each.inject({}) { |memo, (clave,valor) | memo.merge!(valor => procc.yield(clave)) }
end

hash = { 'clave' => 1, :otra_clave => 'valor' }
p procesar_hash(hash, ->(x) { x.to_s.upcase })