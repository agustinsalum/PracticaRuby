

require_relative 'module_genericFactory.rb'

class Auto
    attr_reader :marca

    def initialize(**args)
        @marca = args[:marca]
        @nuevo = args[:nuevo]
        @color = args[:color]
    end

    def isFord?
        self.marca == 'Ford'
    end

end

Auto.include GenericFactory
un_auto = Auto.create(:marca => 'Chevrolet', :nuevo => true, :color => 'Blanco')
p un_auto.isFord?