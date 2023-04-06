# frozen_string_literal: true

require_relative 'file_manager'
require_relative '../data_manager'
require_relative '../../Model/StudentInfo/student'
require_relative '../../Model/StudentInfo/student_display'
require_relative '../../Model/data_list'

class StudentFileManager
	include FileManager
	include DataManager

	def get_display_list(record_count, page, data_list = nil)
		display_data = @strategy.get_display_list(record_count, page, data_list)
		DataList.new display_data unless data_list
		data_list.set_data display_data if data_list
	end

	def create(obj)
		@strategy.create obj
	end

	def read(id)
		data = @strategy.read id
		StudentDisplay.new Student.new data
	end

	def update(id, obj)
		@strategy.update(id, obj)
	end

	def delete(id)
		@strategy.delete(id)
	end

	def count
		@strategy.count
	end

	def read_all
		data = @strategy.read_all
		data.map { |student_data| StudentDisplay.new Student.new student_data }
	end
end
