# frozen_string_literal: true

require 'active_record'
require_relative '../student_repository'
require_relative '../../Lab2/StudentInfo/student'

# Configure database connection
database_config = {
	adapter: 'mysql2',
	host: 'localhost',
	username: 'root',
	password: 'password',
	database: 'mysql'
}

# Connect to database
ActiveRecord::Base.establish_connection(database_config)

def create_student(id)
	Student.new(
		id: id,
		surname: 'Harvey',
		name: 'Steve',
		middle_name: 'Biden',
		contact_info: { phone: '+1234567890', email: 'Steve@email.ru' },
		git: 'https://github.com/Steve'
	)
end

student1 = create_student(0)

repo = StudentRepository.new

repo.save(student1)

found_student = repo.find(student1.id)
puts found_student.to_s

student1.name = "NewName"
repo.update student1

repo.all

repo.delete student1

repo.all


