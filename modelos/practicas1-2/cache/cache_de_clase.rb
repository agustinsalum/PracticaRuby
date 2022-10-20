#!/usr/bin/env ruby

# Ejercicio 2: cache.rb
#
# Modelá una estructura llamada `Cache` que se utilizará como un sistema de caché de
# elementos de cualquier tipo. Los valores almacenados en la caché tendrán un tiempo de
# validez de 3 segundos, pasados los cuales se considerarán expirados. Los valores
# expirados deberán ser removidos de la cache´ al detectar que ya no son válidos.
#
# La definición de la clase debe responder a los siguientes métodos:
#  - cargar(clave, valor): guarda `valor` en la clave `clave` y registra el timestamp
#                          actual de la operación, para saber cuánto tiempo lleva en la
#                          cache ese valor.
#  - expirada?(clave): retorna un valor booleano indicando si la clave `clave` ha expirado.
#  - entradas: devuelve las claves válidas (que no hayan expirado) almacenadas en la cache.
#  - valor_de(clave): busca y retorna el valor asociado a la `clave` que se pasa como
#                     parámetro. Si la clave está expirada, debe removerla de la caché y
#                     retornar `nil`.
#  - `remover(clave)`: elimina la entrada de la caché que se identifica por `clave`.
#
# Además de implementar la caché, en el ejercicio `02_mixin.rb` la deberás deberás utilizar
# para resolver ese ejercicio.
#
# Tips:
#   * Para obtener un timestamp actual podes utilizar `Time.now.to_i`.
#   * Para simular el paso del tiempo, podés utilizar el método `sleep`.
#   * Analizá si conviene modelar los métodos de la caché como métodos de instancia o de clase.



# La forma recomendable es con metodos de clase
class Cache
    @cache = Hash.new()

    # accesor de lectura para la clase
    def self.cache
        @cache
    end
    
    def self.cargar(clave_parametro,valor_parametro)
        # to_i lo transforma en la hora UNIX 
        @cache[clave_parametro] = { valor: valor_parametro, timestamp: Time.now.to_i }  
    end

    
    def self.expirada?(clave)
        # No es necesario el parentesis porque tiene prioridad el operador
        expirada = Time.now.to_i - timestamp_de(clave) > 3
        if expirada
            remover(clave)
        end
        expirada
    end

    def self.timestamp_de(clave)
        @cache.dig(clave, :timestamp) || 0
    end


    def self.entradas
        @cache.keys.reject { |clave| expirada?(clave) }
    end

    def self.valor_de(clave)
        # unless es lo contrario al if
        unless expirada?(clave)
            @cache.dig(clave, :valor) # Ejemplo con dig: { foo: {bar: {baz: 1}}}.dig(:foo, :bar, :baz) # 1
        end        
    end

    def self.remover(clave)
        @cache.delete(clave)
    end

end

=begin

puts ("Ejercicio cache")

Cache.cargar('cache34756454',34756454)
p Cache.cache                             # Mostramos la cache cargada
p Cache.expirada?('cache34756454')        # False --> No esta expirada porque recien fue creada
sleep 4                                   # Pasaron 4 segundos
p Cache.expirada?('cache34756454')        # true --> Expiro porque pasaron 4 segundos

Cache.cargar('cache78532453',78532453)
p Cache.entradas                          # retorna nuestra unica clave
Cache.remover('cache78532453')
p Cache.cache                             # {}

=end