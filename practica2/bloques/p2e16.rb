
def procesar_hash(dic, procc)
    # Se tuvo que hacer con merge porque existia un problema de asignacion
    # Al usar inject con numeros y listas retorna dicho valor, lo cual no existe problema
    # Pero con hashes al hacer "hash[1] = 'hola'"" retorna el valor 'hola', lo cual acumula el valor retornado incorrecto
    # Se soluciona asiendo "hash[1] = 'hola' ; hash" retorna el diccionario completo
    # Tambien se soluciona con "hash.merge(#clave => #valor)" ya que retorna el diccionario completo
    dic.each.inject({}) { |memo, (clave,valor) | memo.merge(valor => procc.yield(clave)) }
end

hash = { 'clave' => 1, :otra_clave => 'valor' }
p procesar_hash(hash, ->(x) { x.to_s.upcase })