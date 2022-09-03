
require 'json/ext' # to use the C based extension instead of json/pure

a=({ perros: 2, gatos: 2, peces: 0, aves: 0 }).to_json
p a