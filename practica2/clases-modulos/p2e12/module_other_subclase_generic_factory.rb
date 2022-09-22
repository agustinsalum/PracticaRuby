

require_relative 'module_genericFactory.rb'

class Notebook
    attr_reader :ram

    def initialize(**args)
        @marca = args[:marca]
        @ram = args[:ram]
        @capacidad = args[:capacidad]
    end

    def isGaming?
        self.ram >= 8
    end

end

Notebook.include GenericFactory
una_notebook = Notebook.create(:marca => 'hp', :ram => 4, :capacidad => 1000)
p una_notebook.isGaming?