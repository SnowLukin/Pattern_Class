require_relative 'Data_list'

class Data_list_Student_short < Data_list
    
    def initialize(student)
        super.initialize([student.id, student.surname, student.contact, student.git])
    end
    
    def set_data(new_data)
        @data = new_data
    end
    
    public
    def get_names
        @data.each { |student| p "#{student.name}" }
    end
    
    def select(number)
        @selected << @data[number].id
    end
    
    def get_selected
        @selected
    end
    
    def get_data
        @data.each { |student| p "#{student.name} #{student.contact} #{student.git}" }
    end
end
