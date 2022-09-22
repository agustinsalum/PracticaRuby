

module GenericFactory
    module ClassGenericFactory
        def create(**args)
            new(**args)
        end
    end
    
    def initialize(**args)
        raise NotImplementedError 
    end

    # Fundamental para que encuentre el metodo create
    def self.included(base)
        base.extend(ClassGenericFactory)
    end
end

