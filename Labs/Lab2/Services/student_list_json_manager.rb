# frozen_string_literal: true

require 'json'
require_relative '../StudentInfo/student_list'
require_relative 'file_manager'
require_relative '../StudentInfo/student'

class StudentListJSONManager < StudentList
	include FileManager

	def initialize(file_path)
		@file_path = file_path
		@file_extension = '.json'
	end

	def load_data
		json_data = File.read(@file_path)
		parsed_data = JSON.parse(json_data, symbolize_names: true)
		students = parsed_data.map { |student_data| Student.new student_data }
		set_data students
	rescue => e
		raise "Exception: #{e.message}"
	end

	def save_data(destination = @file_path)
		File.write(destination, @data.map {|student| student.to_json}.to_json)
	rescue => e
		raise "Exception: #{e.message}"
	end
end
