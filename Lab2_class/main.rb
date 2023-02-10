require_relative 'Student'

def create_four_students
  student1 = Student.new(surname:'Andreeew', name:'Andrew', middle_name:'dsf', git: 'https://github.com/Andrew')
  student2 = Student.new(surname:'Boooob', name:'Bob', middle_name:'asdas', phone: '+1234567890', email: 'Bob@gmail.com')
  student3 = Student.new(surname:'Steeeve', name:'Steve', middle_name:'ass', phone: '+1234567890', email: 'Steve@email.ru', git: 'https://github.com/Steve')
  student4 = Student.from_string('1,Andreeew,Andrew,dsf')
  [student1, student2, student3, student4]
end

def print_students(students)
  students.each do |student|
    puts student
  end
end

def main
  # Create three students
  student1, student2, student3, student4 = create_four_students

  # Print their data
  print_students([student1, student2, student3, student4])
end

main
