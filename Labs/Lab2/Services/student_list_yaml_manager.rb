# frozen_string_literal: true

require_relative '../StudentInfo/student_list'
require_relative '../StudentInfo/student'
require_relative 'file_manager'
require 'yaml'

class StudentListYAMLManager < StudentList
	include FileManager

	def initialize(file_path)
		@file_path = file_path
	end

	def load_data(source = @file_path)
		set_data YAML.load_file(@file_path)
	rescue => e
		raise "Exception: #{e.message}"
	end

	def save_data(destination = @file_path)
		File.open(destination, 'w') { |file| file.write(@data.to_yaml) }
	rescue => e
		raise "Exception: #{e.message}"
	end
end
