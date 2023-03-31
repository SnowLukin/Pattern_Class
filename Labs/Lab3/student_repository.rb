# frozen_string_literal: true

require 'active_record'
require_relative '../Lab2/StudentInfo/student'
require 'student_record'

class StudentRepository

	def save(student)
		StudentRecord.create(
			id: student.id,
			name: student.name,
			surname: student.surname,
			middle_name: student.middle_name,
			git: student.git.to_s,
			contact_info: student.contact_info.to_json
		)
	end

	def find(id)
		record = StudentRecord.find(id)
		record.to_student
	end

	def update(student)
		record = StudentRecord.find(student.id)

		record.update(
			name: student.name,
			surname: student.surname,
			middle_name: student.middle_name,
			git: student.git.to_s,
			contact_info: student.contact_info.to_json
		)
	end

	def delete(student)
		record = StudentRecord.find(student.id)
		record.destroy
	end

	def all
		StudentRecord.all.map(&:to_student)
	end
end

