# frozen_string_literal: true

require_relative '../../Model/StudentInfo/student_display_list'
require_relative '../../Model/StudentInfo/student_display'
require_relative '../../Services/FileManager/student_file_manager'
require_relative '../../Services/APIManager/student_repository'
require_relative '../../Services/APIManager/api_manager'

class StudentDisplayListController

	attr_reader :student_display_list

	def initialize(file_path = nil)
		if file_path
			@student_file_manager = StudentFileManager.new(file_path)
		else
			@student_file_manager = StudentRepository.new APIManager.instance
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
			st1 = create_student 0
			st2 = create_student 1
			st3 = create_student 2
			st4 = create_student 3
			st5 = create_student 4
			@student_file_manager.create st1
			@student_file_manager.create st2
			@student_file_manager.create st3
			@student_file_manager.create st4
			@student_file_manager.create st5
		end
		@student_display_list = StudentDisplayList.new
		load_student_data
	end

	def load_student_data
		students = @student_file_manager.read_all
		student_displays = students.map { |student| StudentDisplay.new(student) }
		@student_display_list.set_data(student_displays)
	end
end