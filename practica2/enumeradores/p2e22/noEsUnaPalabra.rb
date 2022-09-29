
class NoEsUnaPalabra < StandardError
    attr_reader :thing
    def initialize(msg="My default message", thing="apple")
        @thing = thing
        super(msg)
    end
end