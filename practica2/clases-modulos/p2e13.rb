
module ModuloOpposite
    def opposite()
        !self
    end
end

class TrueClass
    include ModuloOpposite
end    
    
    
class FalseClass
    include ModuloOpposite
end

p false.opposite
p true.opposite
p true.opposite.opposite