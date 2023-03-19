# frozen_string_literal: true

require_relative 'student_validator'
require_relative 'Contacts/contact_info'

class Student
	public

	attr_reader :id, :name, :middle_name, :surname, :git, :contact_info

	def initialize(**kwargs)
		@id = kwargs[:id]
		@name = kwargs[:name]
		@surname = kwargs[:surname]
		@middle_name = kwargs[:middle_name]
		@git = kwargs[:git]

		if kwargs[:contact_info]
			@contact_info = ContactInfo.new(kwargs[:contact_info])
		else
			@contact_info = ContactInfo.from_string kwargs[:contact_info_string]
		end

		validate
	end

	def self.from_string(string)
		values = string.split(',')
		Student.new(
			id: values[0].strip,
			name: values[1].strip,
			surname: values[2].strip,
			middle_name: values[3].strip,
			git: values[4].strip,
			contact_info_string: values[5...].join(", ")
		)
	end

	def to_s
		"#{id}, #{name}, #{surname}, #{middle_name}, #{git}, #{contact_info.phone || ""}, #{contact_info.email || ""}, #{contact_info.telegram || ""}"
	end

	def to_json
		{
			id: @id,
			name: @name,
			middle_name: @middle_name,
			surname: @surname,
			git: @git,
			contact_info: @contact_info.to_json
		}
	end

	def short_form
		[id, name_initials, git, contact_info.to_s]
	end

	def get_generic_info
		"#{name_initials}, Git: #{@git}, Contacts: #{contact_info.to_s}"
	end

	# Ex: Ivanov I.I.
	def name_initials
		"#{@surname} #{@name[0]}.#{@middle_name[0]}."
	end

	# MARK: Setters
	def id=(value)
		@id = value
		validate
	end

	def name=(value)
		@name = value
		validate
	end

	def middle_name=(value)
		@middle_name = value
		validate
	end

	def surname=(value)
		@surname = value
		validate
	end

	def git=(value)
		@git = value
		validate
	end

	def contact_info=(value)
		@contact_info = value
		validate
	end

	private

	def validate
		validator = StudentValidator.new
		validator.validate(student: self)
	end
end
