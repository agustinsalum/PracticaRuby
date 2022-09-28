
class Array
    def randomly()
        return self.each { |x| yield(x) } if unless block_given?  # Si no nos pasaron un bloque..
        un_enumerador = Enumerator.new do |y|
            loop do
                self.sample
            end
        end
    end
end
end

#[1,2,3].randomly { |x| p x}
[1,2,3].randomly