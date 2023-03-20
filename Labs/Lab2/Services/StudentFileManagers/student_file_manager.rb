# frozen_string_literal: true

require_relative '../file_manager'
require_relative '../../StudentInfo/student_list'

class StudentFileManager < StudentList
	include FileManager

	private_class_method :new

	def load_data(source = @file_path)
		set_data @strategy.load(source)
	end

	def save_data(destination = @file_path)
		@strategy.save(destination, @data)
	end
end
