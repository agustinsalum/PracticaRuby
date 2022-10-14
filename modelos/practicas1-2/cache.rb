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



class Cache

    @claves = Hash.new()
    @tiempo = Hash.new()

    class << self
        attr_accessor :claves, :tiempo
    end
    
    def self.cargar(clave,valor)
        @claves[clave] = valor
        @tiempo[clave] = Time.now.to_i # to_i lo transforma en la hora UNIX 
    end

    def self.expirada?(clave)
        ((@tiempo[clave] - Time.now.to_i).round) >=3 
    end

    def self.entradas
        @tiempo.reject { |(clave,valor)| expirada?(clave) }

    end

    def self.valor_de(clave)
        expirada?(clave) ? nil : claves[clave]        
    end

    def self.remover(clave)
        @claves.delete(clave)
    end

end

puts ("Ejercicio cache")

Cache.cargar('cache34756454',34756454)
p Cache.expirada?('cache34756454')   # False --> No esta expirada porque recien fue creada
p Cache.entradas                     # {"cache34756454"=>1665707742} --> No expiradas
p Cache.valor_de('cache34756454')    # 34756454 --> Valor de la clave
Cache.remover('cache34756454')       # Se remueve la clave con exito
p Cache.claves                       # {}