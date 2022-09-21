
module Reverso

    # Imprime el object_id del receptor en espejo (en orden inverso).
    def di_tcejbo()
        ((self.object_id).to_s).reverse
    end

    # Imprime el nombre de la clase del receptor en espejo.
    def ssalc()
        ((self.class).to_s).reverse
    end
end

Integer.include Reverso
p 1000.di_tcejbo
p 1000.ssalc