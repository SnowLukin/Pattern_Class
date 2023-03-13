class Data_list
    
    attr_reader :selected
    
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
    
    def select(number)
        @selected << number
    end
    
    def get_selected
        @selected
    end
    
    def get_names
        raise NotImplementedError, "get_names must be implemented in inheriting class"
    end
    
    def get_data
        raise NotImplementedError, "get_data must be implemented in inheriting class"
    end
end
