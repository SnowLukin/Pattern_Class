# frozen_string_literal: true

require_relative '../StudentInfo/student_list'
require_relative '../StudentInfo/student'
require_relative 'file_manager'

class StudentListTxtManager < StudentList

	include FileManager

	def initialize(file_path)
		@file_path = file_path
		@file_extension = '.txt'
	end

	def load_data
		students = File.readlines(@file_path).map { |line| Student.from_string(line) }
		set_data(students)
	rescue => e
		raise "Exception: #{e.message}"
	end

	def save_data(destination = @file_path)
		File.write(destination, @data.map { |student| student.to_s }.join("\n"))
	rescue => e
		raise "Exception: #{e.message}"
	end
end