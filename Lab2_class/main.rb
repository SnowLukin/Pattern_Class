require_relative 'Lab2'

def main
  # Create two students
  student1 = Student.new(
    1,
    'Иванов', 'Иван', 'Иванович',
    '+380000000000',
    '@ivanov',
    'ivanov@gmail.com',
    'ivanovivan'
  )

  student2 = Student.new(
    2,
    'Петров', 'Петр', 'Петрович',
    '+380000000001',
    '@petrov',
    'petrov@gmail.com',
    'petrovpetr'
  )

  # Print their data
  puts student1
  puts student2
end

main
