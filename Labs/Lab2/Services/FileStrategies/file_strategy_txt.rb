# frozen_string_literal: true

require_relative 'file_strategy'

class FileStrategyTXT
	include FileStrategy

	def load(file_path)
		students = File.readlines(file_path).map { |line| Student.from_string(line) }
		students
	rescue => e
		raise "Exception: #{e.message}"
	end

	def save(file_path, data)
		File.write(file_path, data.map { |student| student.to_s }.join("\n"))
	rescue => e
		raise "Exception: #{e.message}"
	end
end
