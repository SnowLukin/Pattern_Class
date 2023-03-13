require_relative 'Student_short'
require_relative 'Student'
require_relative 'Data_list_Student_short'
require_relative 'Student'

def create_four_students
    student1 = Student.new(surname:'Steeeve', name:'Steve', middle_name:'ass', phone: '+1234567890', email: 'Steve@email.ru', git: 'https://github.com/Steve')
    student2 = Student.new(surname:'Steeeve', name:'Steve', middle_name:'ass', phone: '+1234567890', email: 'Steve@email.ru', git: 'https://github.com/Steve')
    student3 = Student.new(surname:'Steeeve', name:'Steve', middle_name:'ass', phone: '+1234567890', email: 'Steve@email.ru', git: 'https://github.com/Steve')
    student4 = Student.new(surname:'Steeeve', name:'Steve', middle_name:'ass', phone: '+1234567890', email: 'Steve@email.ru', git: 'https://github.com/Steve')
    [student1, student2, student3, student4]
end

def print_students(students)
    students.each do |student|
        puts student
    end
end

def create_student_short
    Student_short.new(id: '1', surname: 'Surname', git: 'https://github.com/Name', contact: 'Contact')
end

def test_data_list_student_short
    student = create_student_short
    data_list = Data_list_Student_short.new([student])
    data_list.set_data([student])
    puts data_list.select(0)
    puts data_list.get_names.to_s
    puts data_list.get_data
end


def main_test
    print_students(create_four_students)
    
    test_data_list_student_short
end

main_test
