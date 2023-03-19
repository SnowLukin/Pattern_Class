# frozen_string_literal: true

require_relative '../data_list'
require_relative 'student'

class StudentList < DataList

	def select(number)
		@selected << @data[number].id
	end

	def sort_by_surname
		@data = @data.sort { |student1, student2| student1.surname <=> student2.surname }
	end

	def get_k_n_student_list(k, n, data_list = nil)
		return data_list if data_list != nil
		filtered = @data.select { |student| student.id % n == 0 }
		filtered[0...k].map { |student| student.short_form }
	end
end