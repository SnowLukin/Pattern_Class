# frozen_string_literal: true

require_relative 'file_strategy'

class FileStrategyJSON
	include FileStrategy

	def load(file_path)
		json_data = File.read(file_path)
		parsed_data = JSON.parse(json_data, symbolize_names: true)
		students = parsed_data.map { |student_data| Student.new student_data }
		students
	rescue => e
		raise "Exception: #{e.message}"
	end

	def save(file_path, data)
		File.write(file_path, data.map {|student| student.to_json}.to_json)
	rescue => e
		raise "Exception: #{e.message}"
	end
end
