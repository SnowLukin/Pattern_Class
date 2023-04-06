# frozen_string_literal: true

require_relative 'file_manager'
require_relative '../../Model/StudentInfo/student'
require_relative '../../Model/StudentInfo/student_display'
require_relative 'FileStrategies/txt_file_strategy'
require_relative 'FileStrategies/json_file_strategy'
require_relative 'FileStrategies/yaml_file_strategy'

class StudentFileManager

	include FileManager

	def get_display_list(record_count, page, data_list = nil)
		start_index = record_count * (page - 1)
		end_index = start_index + record_count
		display_data = @data[start_index..end_index]
		DataList.new display_data unless data_list
		data_list.set_data display_data if data_list
	end

	def create(obj)
		obj.id = @data.map { |s| s[:id] }.max + 1
		@data << obj.to_json
		@strategy.save_data(@data)
	end

	def read(id)
		data = @data.find { |element| element[:id] == id }
		StudentDisplay.new Student.new data
	end

	def update(id, obj)
		updated_student = obj.to_json
		updated_student[:id] = @data[index][:id]
		@data[index] = updated_student
		@strategy.save_data(@data)
	end

	def delete(id)
		@data.delete_at(index)
		@strategy.save_data(@data)
	end

	def count
		@data.count
	end

	def read_all
		@data.map { |student_data| StudentDisplay.new Student.new student_data }
	end

	def file_path=(value)
		@file_path = value
		set_strategy
		@data = @strategy.load_data
	end

	private
	def set_strategy
		case File.extname(@file_path)
		when '.txt'
			@strategy = TXTFileStrategy.new @file_path
		when '.json'
			@strategy = JSONFileStrategy.new @file_path
		when '.yaml'
			@strategy = YAMLFileStrategy.new @file_path
		else
			raise "Unknown file type"
		end
	end
end
