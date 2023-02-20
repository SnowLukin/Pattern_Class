class Data_list
    def initialize(data)
        @data = data
        @selected = []
    end
    
    def [](index)
        @data[index]
    end
    
    def size
        @data.size
    end
    
    def each
        @data.each { |element| yield element }
    end
    
    private
      attr_reader :data
end
