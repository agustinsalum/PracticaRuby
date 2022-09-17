
require 'time'

def cuanto_falta(time = Time.new(Time.new.year, Time.new.month, (Time.new.day)+1, 0, 0, 0.0))
    ((Time.now - time) / 60).abs
end

t = (Time.new(Time.new.year, Time.new.month, Time.new.day, 2, 0, 0.0))

p cuanto_falta(t)


