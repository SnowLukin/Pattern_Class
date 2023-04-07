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