require_relative 'Lab2'

def create_three_students
  student1 = Student.new(surname: 'Andrewwww', first_name: 'Andrew', git: 'https://github.com/Andrew')
  student2 = Student.new(surname: 'Boooob', first_name: 'Bob', phone: '1234567890', mail: 'Bob@gmail.com')
  student3 = Student.new(surname: 'Steeeve', first_name: 'Steve', phone: '1234567890', mail: 'Steve@mail.ru', git: 'https://github.com/Steve')
  [student1, student2, student3]
end

def print_students(students)
  students.each do |student|
    puts student
  end
end

def main
  # Create three students
  student1, student2, student3 = create_three_students

  # Print their data
  print_students([student1, student2, student3])
end

main
