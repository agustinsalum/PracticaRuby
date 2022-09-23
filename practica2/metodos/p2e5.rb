
require 'time'

def cuanto_falta(time = Time.new(Time.new.year, Time.new.month, (Time.new.day)+1, 0, 0, 0.0))
    # {condicion} ? {then} : {else}
    (time > Time.now) ? (((Time.now - time) / 60).abs).to_i : "Por favor, ingrese una fecha posterior" 
end

t = (Time.new(Time.new.year, Time.new.month, Time.new.day, 20, 0, 0.0))
p cuanto_falta(t)
p cuanto_falta()

