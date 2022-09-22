

module GenericFactory
    module ClassGenericFactory
        def create(**args)
            new(**args)
        end
    end
    
    def initialize(**args)
        raise NotImplementedError 
    end
end

