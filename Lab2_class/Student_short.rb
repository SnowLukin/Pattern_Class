require_relative 'Student'

class Student_short
  attr_reader :id, :surname, :git, :contact

  def initialize(student)
    @id = student.id
    @surname = student.surname + student.name[0] + student.middle_name[0]
    @git = student.git
    @contact = student.get_contact_info
  end

  def self.from_string(id, string)
    surname, git, contact = string.split(',')
    params = { id: id, surname: surname, git: git, contact: contact }
    new(params)
  end

  def self.from_student(student)
    params = { id: student.id, surname: student.surname, git: student.git, contact: student.contact }
    new(params)
  end

  def to_s
    "ID: #{@id}, Surname: #{@surname}, Git: #{@git}, Contact: #{@contact}"
  end
end