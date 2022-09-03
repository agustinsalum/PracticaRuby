
require 'json'

a=({ perros: 2, gatos: 2, peces: 0, aves: 0 }).to_json
p a
p a.class