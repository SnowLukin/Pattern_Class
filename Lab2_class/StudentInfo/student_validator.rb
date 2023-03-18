# frozen_string_literal: true

require_relative 'student'

class StudentValidator
    
    def validate(student: Student)
        raise ArgumentError, "Name, surname and middle name are required." unless student.name && student.surname && student.middle_name
        raise ArgumentError, "Git field is required." unless student.git
        raise ArgumentError, "Git in wrong format." unless is_valid_git?(student.git)
        raise ArgumentError, "At least one contact (phone, telegram, mail) is required." unless student.contact_info&.valid?
    end
    
    private
    def is_valid_git?(git)
        git =~ /\Ahttps:\/\/github\.com\/\w+\z/
    end
end
