# frozen_string_literal: true

require_relative '../Lab2/StudentInfo/student'
require 'active_record'

class StudentRecord < ActiveRecord::Base
	self.table_name = "students"

	def to_student
		Student.from_record self
	end

	def from_student(student)
		self.attributes = student.to_json
	end
end