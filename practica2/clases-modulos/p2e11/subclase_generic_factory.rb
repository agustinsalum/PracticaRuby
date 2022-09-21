

require_relative 'genericFactory.rb'

class Auto < GenericFactory
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


un_auto = Auto.create(:marca => 'Chevrolet', :nuevo => true, :color => 'Blanco')
p un_auto.isFord?