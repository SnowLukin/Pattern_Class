# frozen_string_literal: true

require_relative '../file_manager'
module FileStrategy

	include FileManager

	def initialize(file_path)
		super
		@data = load_data
	end

	def get_display_data(record_count, page)
		start_index = record_count * (page - 1)
		end_index = start_index + record_count
		@data[start_index..end_index]
	end

	def sort(symbol) # :surname for student
		@data.sort_by! { |obj| obj[symbol] }
	end

	def create(obj)
		obj.id = @data.map { |s| s[:id] }.max + 1
		@data << obj.to_json
		save_data
	end

	def read(id)
		@data.find { |element| element[:id] == id }
	end

	def update(index, obj)
		updated_student = obj.to_json
		updated_student[:id] = @data[index][:id]
		@data[index] = updated_student
		save_data
	end

	def delete(index)
		@data.delete_at(index)
		save_data
	end

	def count
		@data.count
	end

	def read_all
		@data
	end

	def load_data
	end

	def save_data
	end

end
