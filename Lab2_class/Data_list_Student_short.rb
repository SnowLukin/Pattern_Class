require_relative 'Data_list'

class Data_list_Student_short < Data_list
    
    def set_data(new_data)
        @data = new_data
    end
    
    def select(number)
        @selected << @data[number].id
    end
    
    def get_names
        %w[id surname git contact]
    end
    
    def get_data
        @data.each { |student|
            [student.id, student.surname, student.git, student.contact]
        }
    end
end
