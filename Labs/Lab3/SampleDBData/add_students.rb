# frozen_string_literal: true

require 'pg'
require_relative '../../StudentApp/Services/APIManager/api_manager'
require_relative '../../StudentApp/Services/APIManager/student_repository'

api_manager = APIManager.instance

student_repository = StudentRepository.new api_manager

# Dummy student object
def dummy_student
	Student.new(
		surname: 'Harvey',
		name: 'Steve',
		middle_name: 'Biden',
		contact_info: { phone: '+1234567890', email: 'Steve@email.ru' },
		git: 'https://github.com/Steve'
	)
end

# Create object and add it to the database
student_repository.create dummy_student

# Select the student at id
student = student_repository.read(6)
puts student.to_s